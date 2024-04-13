import streamlit as st

st.title("森永動物園")

col1, col2, col3 ,col4 ,col5 = st.columns(5)

with col1:
   st.header("A cat")
   st.image("https://static.streamlit.io/examples/cat.jpg")

with col2:
   st.header("A dog")
   st.image("https://static.streamlit.io/examples/dog.jpg")

with col3:
   st.header("An owl")
   st.image("https://static.streamlit.io/examples/owl.jpg")

with col4:
   st.header("A bear")
   st.image("https://files.bonecollection.com/assets/shop/blog/2021/about-winnie-the-pooh/%E5%B0%8F%E7%86%8A%E7%B6%AD%E5%B0%BCWinnie-the-Pooh.jpg")

with col5:
   st.header("A blajha")
   st.image("https://www.ikea.com.tw/dairyfarm/tw/images/773/0877393_PE730957_S4.webp")