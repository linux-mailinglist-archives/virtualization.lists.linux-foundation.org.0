Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B191865E2
	for <lists.virtualization@lfdr.de>; Mon, 16 Mar 2020 08:49:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5564D88D02;
	Mon, 16 Mar 2020 07:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IIWIf7ZxwHKw; Mon, 16 Mar 2020 07:49:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EB13888D93;
	Mon, 16 Mar 2020 07:49:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C67BCC013E;
	Mon, 16 Mar 2020 07:49:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE44AC013E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 07:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C6D1F204C5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 07:49:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Szp+TzmNkg2H
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 07:49:15 +0000 (UTC)
X-Greylist: delayed 00:05:07 by SQLgrey-1.7.6
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by silver.osuosl.org (Postfix) with ESMTPS id 88BD8203A9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 07:49:14 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420; MF=alex.shi@linux.alibaba.com;
 NM=1; PH=DS; RN=16; SR=0; TI=SMTPD_---0TsjIkOZ_1584344641; 
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com
 fp:SMTPD_---0TsjIkOZ_1584344641) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 16 Mar 2020 15:44:01 +0800
Subject: Re: [PATCH v2,1/2] doc: zh_CN: index files in filesystems subdirectory
To: Wang Wenhu <wenhu.wang@vivo.com>, Jonathan Corbet <corbet@lwn.net>,
 Vivek Goyal <vgoyal@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Harry Wei <harryxiyou@gmail.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
 Eric Biggers <ebiggers@google.com>,
 Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org
References: <20200315092810.87008-1-wenhu.wang@vivo.com>
 <20200315155258.91725-1-wenhu.wang@vivo.com>
From: Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <c163e158-125c-1b31-1bfb-6927b86d2a82@linux.alibaba.com>
Date: Mon, 16 Mar 2020 15:44:01 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200315155258.91725-1-wenhu.wang@vivo.com>
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
MDIwLzMvMTUg5LiL5Y2IMTE6NTIsIFdhbmcgV2VuaHUg5YaZ6YGTOgo+IEFkZCBmaWxlc3lzdGVt
cyBzdWJkaXJlY3RvcnkgaW50byB0aGUgdGFibGUgb2YgQ29udGVudHMgZm9yIHpoX0NOLAo+IGFs
bCB0cmFuc2xhdGlvbnMgcmVzaWRpbmcgb24gaXQgd291bGQgYmUgaW5kZXhlZCBjb252ZW5pZW50
bHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2FuZyBXZW5odSA8d2VuaHUud2FuZ0B2aXZvLmNvbT4K
PiAtLS0KPiBDaGFuZ2Vsb2c6Cj4gIC0gdjIgYWRkZWQgU1BEWCBoZWFkZXIKPiAtLS0KPiAgRG9j
dW1lbnRhdGlvbi9maWxlc3lzdGVtcy9pbmRleC5yc3QgICAgICAgICAgIHwgIDIgKysKPiAgLi4u
L3RyYW5zbGF0aW9ucy96aF9DTi9maWxlc3lzdGVtcy9pbmRleC5yc3QgIHwgMjkgKysrKysrKysr
KysrKysrKysrKwo+ICBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmRleC5yc3Qg
ICAgfCAgMSArCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZmlsZXN5c3RlbXMv
aW5kZXgucnN0Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvaW5k
ZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9pbmRleC5yc3QKPiBpbmRleCAzODZl
YWFkMDA4YjIuLmFiNDdkNWIxZjA5MiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2ZpbGVz
eXN0ZW1zL2luZGV4LnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvaW5kZXgu
cnN0Cj4gQEAgLTEsMyArMSw1IEBACj4gKy4uIF9maWxlc3lzdGVtc19pbmRleDoKPiArCj4gID09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiAgRmlsZXN5c3RlbXMgaW4gdGhlIExpbnV4
IGtlcm5lbAo+ICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2ZpbGVzeXN0ZW1zL2luZGV4LnJzdCBi
L0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2ZpbGVzeXN0ZW1zL2luZGV4LnJzdAo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wYTJjYWJmZWFmN2IK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
ZmlsZXN5c3RlbXMvaW5kZXgucnN0Cj4gQEAgLTAsMCArMSwyOSBAQAo+ICsuLiBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICsuLiByYXc6OiBsYXRleAo+ICsKPiArCVxyZW5ld2Nv
bW1hbmRcdGhlc2VjdGlvbioKPiArCVxyZW5ld2NvbW1hbmRcdGhlc3Vic2VjdGlvbioKPiArCj4g
Ky4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdAo+ICsKPiArOk9yaWdpbmFsOiA6
cmVmOmBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2luZGV4LnJzdCA8ZmlsZXN5c3RlbXNfaW5k
ZXg+YAo+ICs6VHJhbnNsYXRvcjogV2FuZyBXZW5odSA8d2VuaHUud2FuZ0B2aXZvLmNvbT4KPiAr
Cj4gKy4uIF9jbl9maWxlc3lzdGVtc19pbmRleDoKPiArCj4gKz09PT09PT09PT09PT09PT09PT09
PT09PQo+ICtMaW51eCBLZXJuZWzkuK3nmoTmlofku7bns7vnu58KPiArPT09PT09PT09PT09PT09
PT09PT09PT09Cj4gKwo+ICvov5nku73mraPlnKjlvIDlj5HnmoTmiYvlhozmiJborrjlnKjmnKrm
naXmn5DkuKrovonnhYznmoTml6XlrZDph4zku6XmmJPmh4LnmoTlvaLlvI/lsIZMaW51eOiZmuaL
n1wKPiAr5paH5Lu257O757uf77yIVkZT77yJ5bGC5Lul5Y+K5Z+65LqO5YW25LiK55qE5ZCE56eN
5paH5Lu257O757uf5aaC5L2V5bel5L2c5ZGI546w57uZ5aSn5a6244CC5b2T5YmNXAo+ICvlj6/k
u6XnnIvliLDkuIvpnaLnmoTlhoXlrrnjgIIKPiArCj4gK+aWh+S7tuezu+e7nwo+ICs9PT09PT09
PQo+ICsKPiAr5paH5Lu257O757uf5a6e546w5paH5qGj44CCCj4gKwo+ICsuLiB0b2N0cmVlOjoK
PiArICAgOm1heGRlcHRoOiAyCj4gKwo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9D
Ti9pbmRleC5yc3QKPiBpbmRleCBkMzE2NTUzNWVjOWUuLjc2ODUwYTVkZDk4MiAxMDA2NDQKPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmRleC5yc3QKPiArKysgYi9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmRleC5yc3QKPiBAQCAtMTQsNiArMTQs
NyBAQAo+ICAgICA6bWF4ZGVwdGg6IDIKPiAgCj4gICAgIHByb2Nlc3MvaW5kZXgKPiArICAgZmls
ZXN5c3RlbXMvaW5kZXgKPiAgCj4gIOebruW9leWSjOihqOagvAo+ICAtLS0tLS0tLS0tCj4gCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
