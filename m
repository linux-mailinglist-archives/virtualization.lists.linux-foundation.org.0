Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B27A1865EC
	for <lists.virtualization@lfdr.de>; Mon, 16 Mar 2020 08:50:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E7F66204C8;
	Mon, 16 Mar 2020 07:50:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YBt0fXj59V7p; Mon, 16 Mar 2020 07:50:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4B0B6204C5;
	Mon, 16 Mar 2020 07:50:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D83AC013E;
	Mon, 16 Mar 2020 07:50:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A71CC013E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 07:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 22B9E204C5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 07:50:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LZOoOQQK7mTF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 07:50:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by silver.osuosl.org (Postfix) with ESMTPS id BFC72203A9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 07:50:05 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e07488; MF=alex.shi@linux.alibaba.com;
 NM=1; PH=DS; RN=16; SR=0; TI=SMTPD_---0Tsj-C4w_1584344695; 
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com
 fp:SMTPD_---0Tsj-C4w_1584344695) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 16 Mar 2020 15:44:56 +0800
Subject: Re: [PATCH v2,2/2] doc: zh_CN: add translation for virtiofs
To: Wang Wenhu <wenhu.wang@vivo.com>, Jonathan Corbet <corbet@lwn.net>,
 Vivek Goyal <vgoyal@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Harry Wei <harryxiyou@gmail.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
 Christian Brauner <christian@brauner.io>, Eric Biggers
 <ebiggers@google.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-fsdevel@vger.kernel.org
References: <20200315092810.87008-1-wenhu.wang@vivo.com>
 <20200315155258.91725-1-wenhu.wang@vivo.com>
 <20200315155258.91725-2-wenhu.wang@vivo.com>
From: Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <5116273f-c88e-543f-7f91-a45ae2d3d505@linux.alibaba.com>
Date: Mon, 16 Mar 2020 15:44:55 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200315155258.91725-2-wenhu.wang@vivo.com>
Cc: kernel@vivo.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

UmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4LnNoaUBsaW51eC5hbGliYWJhLmNvbT4KCuWcqCAy
MDIwLzMvMTUg5LiL5Y2IMTE6NTIsIFdhbmcgV2VuaHUg5YaZ6YGTOgo+IFRyYW5zbGF0ZSB2aXJ0
aW9mcy5yc3QgaW4gRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy8gaW50byBDaGluZXNlLgo+IAo+
IEFja2VkLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogV2FuZyBXZW5odSA8d2VuaHUud2FuZ0B2aXZvLmNvbT4KPiAtLS0KPiBDaGFuZ2Vs
b2cgdjI6Cj4gIC0gYWRkIGEgYmxhbmsgbGluZSBpbiB0aGUgZW5kIG9mIGluZGV4LnJzdCB0byBp
bmRleCB2aXJ0aW9mcy5yc3QKPiAgLSBBc2tlZC1ieSBTdGVmYW4gSGFqbm9jemkKPiAgLSBhZGRl
ZCBTUERYIGhlYWRlciBhbmQgQ29weXJpZ2h0IGluZm8KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9m
aWxlc3lzdGVtcy92aXJ0aW9mcy5yc3QgICAgICAgIHwgIDIgKwo+ICAuLi4vdHJhbnNsYXRpb25z
L3poX0NOL2ZpbGVzeXN0ZW1zL2luZGV4LnJzdCAgfCAgMiArCj4gIC4uLi96aF9DTi9maWxlc3lz
dGVtcy92aXJ0aW9mcy5yc3QgICAgICAgICAgICB8IDYxICsrKysrKysrKysrKysrKysrKysKPiAg
MyBmaWxlcyBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9maWxlc3lzdGVtcy92aXJ0aW9mcy5yc3QK
PiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy92aXJ0aW9mcy5yc3Qg
Yi9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL3ZpcnRpb2ZzLnJzdAo+IGluZGV4IDRmMzM4ZTNj
YjNmNy4uN2M0MzAxZDk2MmY4IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZmlsZXN5c3Rl
bXMvdmlydGlvZnMucnN0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy92aXJ0aW9m
cy5yc3QKPiBAQCAtMSwzICsxLDUgQEAKPiArLi4gX3ZpcnRpb2ZzX2luZGV4Ogo+ICsKPiAgLi4g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiAgCj4gID09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9maWxlc3lzdGVtcy9pbmRleC5yc3QgYi9Eb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9maWxlc3lzdGVtcy9pbmRleC5yc3QKPiBpbmRleCAw
YTJjYWJmZWFmN2IuLmZkMzcwMGE0ZGI2ZCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi9maWxlc3lzdGVtcy9pbmRleC5yc3QKPiArKysgYi9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9maWxlc3lzdGVtcy9pbmRleC5yc3QKPiBAQCAtMjcsMyAr
MjcsNSBAQCBMaW51eCBLZXJuZWzkuK3nmoTmlofku7bns7vnu58KPiAgLi4gdG9jdHJlZTo6Cj4g
ICAgIDptYXhkZXB0aDogMgo+ICAKPiArICAgdmlydGlvZnMKPiArCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2ZpbGVzeXN0ZW1zL3ZpcnRpb2ZzLnJzdCBi
L0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2ZpbGVzeXN0ZW1zL3ZpcnRpb2ZzLnJz
dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5jZDgzNmE5YjJh
YzQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vZmlsZXN5c3RlbXMvdmlydGlvZnMucnN0Cj4gQEAgLTAsMCArMSw2MSBAQAo+ICsuLiBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICsuLiByYXc6OiBsYXRleAo+ICsKPiArCVxy
ZW5ld2NvbW1hbmRcdGhlc2VjdGlvbioKPiArCVxyZW5ld2NvbW1hbmRcdGhlc3Vic2VjdGlvbioK
PiArCj4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdAo+ICsKPiArOk9yaWdp
bmFsOiA6cmVmOmBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL3ZpcnRpb2ZzLnJzdCA8dmlydGlv
ZnNfaW5kZXg+YAo+ICsKPiAr6K+R6ICFCj4gKzo6Cj4gKwo+ICsJ5Lit5paH54mI57u05oqk6ICF
77yaIOeOi+aWh+iZjiBXYW5nIFdlbmh1IDx3ZW5odS53YW5nQHZpdm8uY29tPgo+ICsJ5Lit5paH
54mI57+76K+R6ICF77yaIOeOi+aWh+iZjiBXYW5nIFdlbmh1IDx3ZW5odS53YW5nQHZpdm8uY29t
Pgo+ICsJ5Lit5paH54mI5qCh6K+R6ICFOiAg546L5paH6JmOIFdhbmcgV2VuaHUgPHdlbmh1Lndh
bmdAdml2by5jb20+Cj4gKwo+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09Cj4gK3ZpcnRpb2ZzOiB2aXJ0aW8tZnMg5Li75py6PC0+5a6i5py65YWx5Lqr5paH5Lu2
57O757ufCj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiAr
Cj4gKy0gQ29weXJpZ2h0IChDKSAyMDIwIFZpdm8gQ29tbXVuaWNhdGlvbiBUZWNobm9sb2d5IENv
LiBMdGQuCj4gKwo+ICvku4vnu40KPiArPT09PQo+ICtMaW51eOeahHZpcnRpb2Zz5paH5Lu257O7
57uf5a6e546w5LqG5LiA5Liq5Y2K6Jma5ouf5YyWVklSVElP57G75Z6L4oCcdmlydGlvLWZz4oCd
6K6+5aSH55qE6amx5Yqo77yM6YCa6L+H6K+lXAo+ICvnsbvlnovorr7lpIflrp7njrDlrqLmnLo8
LT7kuLvmnLrmlofku7bns7vnu5/lhbHkuqvjgILlroPlhYHorrjlrqLmnLrmjILovb3kuIDkuKrl
t7Lnu4/lr7zlh7rliLDkuLvmnLrnmoTnm67lvZXjgIIKPiArCj4gK+WuouacuumAmuW4uOmcgOim
geiuv+mXruS4u+acuuaIluiAhei/nOeoi+ezu+e7n+S4iueahOaWh+S7tuOAguS9v+eUqOWcuuaZ
r+WMheaLrO+8muWcqOaWsOWuouacuuWuieijheaXtuiuqeaWh+S7tuWvueWFtlwKPiAr5Y+v6KeB
77yb5LuO5Li75py65LiK55qE5qC55paH5Lu257O757uf5ZCv5Yqo77yb5a+55peg54q25oCB5oiW
5Li05pe25a6i5py65o+Q5L6b5oyB5LmF5a2Y5YKo5ZKM5Zyo5a6i5py65LmL6Ze05YWx5Lqr55uu
5b2V44CCCj4gKwo+ICvlsL3nrqHlnKjmn5Dkupvku7vliqHlj6/og73pgJrov4fkvb/nlKjlt7Lm
nInnmoTnvZHnu5zmlofku7bns7vnu5/lrozmiJDvvIzkvYbmmK/ljbTpnIDopoHpnZ7luLjpmr7k
u6Xoh6rliqjljJbnmoTphY3nva5cCj4gK+atpemqpO+8jOS4lOWwhuWtmOWCqOe9kee7nOaatOmc
sue7meWuouacuuOAguiAjHZpcnRpby1mc+iuvuWkh+mAmui/h+aPkOS+m+S4jee7j+i/h+e9kee7
nOeahOaWh+S7tuezu+e7n+iuv+mXruaWh+S7tlwKPiAr55qE6K6+6K6h5pa55byP6Kej5Yaz5LqG
6L+Z5Lqb6Zeu6aKY44CCCj4gKwo+ICvlj6blpJbvvIx2aXJ0by1mc+iuvuWkh+WPkeaMpeS6huS4
u+WuouacuuWFseWtmOeahOS8mOeCueaPkOmrmOS6huaAp+iDve+8jOW5tuS4lOaPkOS+m+S6hue9
kee7nOaWh+S7tuezu+e7n+aJgOS4jeWFt+Wkhwo+ICvnmoTkuIDkupvor63kuYnlip/og73jgIIK
PiArCj4gK+eUqOazlQo+ICs9PT09Cj4gK+S7pWBgbXlmc2Bg5qCH562+5bCG5paH5Lu257O757uf
5oyC6L295YiwYGAvbW50YGA6Cj4gKwo+ICsuLiBjb2RlLWJsb2NrOjogc2gKPiArCj4gKyAgZ3Vl
c3QjIG1vdW50IC10IHZpcnRpb2ZzIG15ZnMgL21udAo+ICsKPiAr6K+35p+l6ZiFIGh0dHBzOi8v
dmlydGlvLWZzLmdpdGxhYi5pby8g5LqG6Kej6YWN572uUUVNVeWSjHZpcnRpb2ZzZOWuiOaKpOeo
i+W6j+eahOivpue7huS/oeaBr+OAggo+ICsKPiAr5YaF5bmVCj4gKz09PT0KPiAr55Sx5LqOdmly
dGlvLWZz6K6+5aSH5bCGRlVTReWNj+iurueUqOS6juaWh+S7tuezu+e7n+ivt+axgu+8jOWboOat
pExpbnV455qEdmlydGlvZnPmlofku7bns7vnu5/kuI5GVVNF5paHXAo+ICvku7bns7vnu5/lrqLm
iLfnq6/ntKflr4bpm4bmiJDlnKjkuIDotbfjgILlrqLmnLrlhYXlvZNGVVNF5a6i5oi356uv6ICM
5Li75py65YWF5b2TRlVTReacjeWKoeWZqO+8jOWGheaguOS4jueUqOaIt+epulwKPiAr6Ze05LmL
6Ze055qEL2Rldi9mdXNl5o6l5Y+j55SxdmlydGlvLWZz6K6+5aSH5o6l5Y+j5Luj5pu/44CCCj4g
Kwo+ICtGVVNF6K+35rGC6KKr572u5LqO6Jma5ouf6Zif5YiX5Lit55Sx5Li75py65aSE55CG44CC
5Li75py65aGr5YWF57yT5Yay5Yy65Lit55qE5ZON5bqU6YOo5YiG77yM6ICM5a6i5py65aSE55CG
6K+35rGC55qE5a6M5oiQ6YOo5YiG44CCCj4gKwo+ICvlsIYvZGV2L2Z1c2XmmKDlsITliLDomZrm
i5/pmJ/liJfpnIDopoHop6PlhrMvZGV2L2Z1c2XlkozomZrmi5/pmJ/liJfkuYvpl7Tor63kuYnk
uIrnmoTlt67lvILjgILmr4/mrKHor7vlj5ZcCj4gKy9kZXYvZnVzZeiuvuWkh+aXtu+8jEZVU0Xl
rqLmiLfnq6/pg73lj6/ku6XpgInmi6nopoHkvKDovpPnmoTor7fmsYLvvIzku47ogIzlj6/ku6Xk
vb/mn5Dkupvor7fmsYLkvJjlhYjkuo7lhbbku5ZcCj4gK+ivt+axguOAguiZmuaLn+mYn+WIl+ac
ieWFtumYn+WIl+ivreS5ie+8jOaXoOazleabtOaUueW3suWFpemYn+ivt+axgueahOmhuuW6j+OA
guWcqOiZmuaLn+mYn+WIl+W3sua7oeeahOaDheWGteS4i+WwpAo+ICvlhbblhbPplK7vvIzlm6Dk
uLrmraTml7bkuI3lj6/og73liqDlhaXpq5jkvJjlhYjnuqfnmoTor7fmsYLjgILkuLrkuobop6Pl
hrPmraTlt67lvILvvIx2aXJ0aW8tZnPorr7lpIfph4fnlKjigJxoaXByaW/igJ1cCj4gK++8iOmr
mOS8mOWFiOe6p++8ieiZmuaLn+mYn+WIl++8jOS4k+mXqOeUqOS6juacieWIq+S6juaZrumAmuiv
t+axgueahOmrmOS8mOWFiOe6p+ivt+axguOAggo+IApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
