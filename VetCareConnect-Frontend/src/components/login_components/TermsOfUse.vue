<template>
    <div class="darkBack">
        <div class="front">
            <div class="close">
                <img @click="TogglePopup()" src="../../assets/icons/close.svg">
            </div>
            <h3>Felhasználási feltételeink</h3>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Voluptate dicta hic modi, est impedit doloribus
                sapiente. Quibusdam vitae laborum deserunt reiciendis tenetur. Voluptatibus ex pariatur nihil vero,
                porro ad, quo aliquam quae quam sed sit ratione reiciendis dolore blanditiis similique soluta est minima
                provident a nobis? Corrupti quisquam ipsum, saepe quos, temporibus sapiente consectetur natus quas
                blanditiis explicabo accusamus nihil fugiat cum rem magni placeat nam possimus soluta ullam quidem,
                obcaecati quod non. Voluptas eum dolor sint suscipit laborum temporibus consequuntur, itaque maiores
                pariatur optio ex, necessitatibus quae cum modi animi facere. Quas inventore corporis harum nam laborum
                molestiae blanditiis at minus sed enim, commodi non error ducimus sunt totam qui modi animi quibusdam
                fuga a facere. Voluptatem magnam dicta sapiente voluptates cumque necessitatibus quis aut velit sequi
                repudiandae perferendis, praesentium architecto exercitationem consequuntur incidunt cum quasi.
                Excepturi, beatae voluptatum perspiciatis repellendus incidunt nostrum veniam quae necessitatibus quis
                alias, tempora id ratione illo quibusdam animi, vero saepe neque asperiores est quisquam amet obcaecati.
                Eveniet officiis enim, ad, aliquid est maiores adipisci pariatur ullam tempore dolore quis incidunt,
                atque quisquam! Impedit blanditiis tenetur quas dolores vitae fuga, accusamus enim nam ad facere alias
                in quam ipsum delectus est dignissimos quaerat incidunt aspernatur ducimus minima rem ipsa vero libero
                harum! Accusamus nihil aperiam non ipsam sed dolorum odit incidunt nesciunt, eos sequi iure beatae
                minima officiis laboriosam! Ad sapiente, animi quis obcaecati enim iure mollitia ducimus, odit
                consequuntur vel praesentium totam accusamus reiciendis facere aliquid maxime labore illo laudantium
                eligendi nisi debitis repellendus. Sint doloremque excepturi nam hic placeat, vitae quam officia quaerat
                ullam esse voluptas maiores numquam necessitatibus neque culpa. Quos autem temporibus qui consequatur
                eos aperiam consectetur quaerat neque alias nihil magnam error eaque ipsum praesentium, sint libero
                repudiandae. Qui, laborum quam tenetur nemo itaque nisi quidem commodi? Inventore recusandae, quo
                aspernatur iure ipsa quaerat esse excepturi earum nulla at, nihil facere, vel beatae consequatur
                ratione! Corrupti a quis molestias inventore alias odit at repellat fugiat mollitia voluptates? Vel ex
                animi aliquid voluptatem deserunt temporibus eum voluptatibus exercitationem molestias, illo eveniet.
                Iusto, autem quos ipsam beatae unde nobis? Obcaecati ut atque iste recusandae velit neque vero, porro
                repellendus sed ipsa similique deserunt cupiditate sint unde libero, impedit perferendis aperiam fuga
                qui enim omnis minima temporibus quisquam debitis? Temporibus explicabo, alias necessitatibus ad aperiam
                rerum veritatis exercitationem in a, cumque error ipsum vel atque nisi, beatae molestias fugiat. Quo
                vero aliquam at provident vel. Consectetur fuga molestiae, maxime inventore praesentium enim saepe minus
                porro veritatis distinctio ratione aliquam possimus quae facere iure unde. Culpa expedita, illo dicta
                nemo dolor deserunt deleniti sit odit quam. Aliquid, quia doloribus, voluptate aliquam accusantium iste
                fuga ducimus architecto nihil, magnam molestiae dolorem atque eligendi quod repudiandae dolorum odit
                placeat itaque? In laudantium, deserunt molestias repellendus consequuntur tenetur corrupti aut! Animi
                omnis quod hic unde impedit quidem quos, iste consequuntur fuga ratione porro ullam debitis corrupti
                quam? Libero ratione dolorem cumque dicta nihil fugit blanditiis provident non, repellat, eveniet ipsam
                consequatur commodi saepe soluta debitis quos.</p>
            <button @click="TogglePopup()">Értettem</button>
        </div>
    </div>
</template>

<script setup>
const props = defineProps(['TogglePopup']);
</script>

<style scoped>
.front {
    background-color: #fff;
    min-width: 300px;
    border-radius: 7px;
    width: 60%;
    height: 60vh;
    padding: 6vh;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    overflow-y: scroll;
    position: relative;
}

.close {
    position: absolute;
    top: 5%;
    right: 5%;
}

.close:hover {
    transform: scale(1.1);
    transition: 200ms;
}

button {
    background: #246951;
    font-size: 1.05rem;
    width: 120px;
    border: 0;
    padding: 5px;
    color: white;
    border-radius: 7px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    display: flex;
    align-items: center;
    justify-content: center;
}
</style>