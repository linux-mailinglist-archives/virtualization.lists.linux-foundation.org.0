Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AF42D9202
	for <lists.virtualization@lfdr.de>; Mon, 14 Dec 2020 04:13:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D8BB185D08;
	Mon, 14 Dec 2020 03:13:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id whnS0DJMr_6c; Mon, 14 Dec 2020 03:13:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3B1E085C86;
	Mon, 14 Dec 2020 03:13:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D4EEC013B;
	Mon, 14 Dec 2020 03:13:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AB0AEC013B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Dec 2020 03:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9935185BFB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Dec 2020 03:13:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sVI7IIo-BEtS
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Dec 2020 03:13:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E41ED85BF2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Dec 2020 03:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607915618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ybh/R/4GdDHQLyi7K+E2pe9l0OU63WmaJrxO4w9fLUU=;
 b=PMIiVeuBpRgV4Y+96pKgclnLZ/smq3Zo5m4Pr2KJqDXykD4waKKWImR7AzoP1d0WI/Qga6
 A7R2AIiZ27EbFTrDQ+REnVLbLKKzvfG8PJmBib1aw9T8P91Od04c2OJi8lja2UG27HZEmQ
 0bLoFlgbpzBfDhV1YmS8YPr80FAYigs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-bsGc3wo6PHivHNPtnxOzUA-1; Sun, 13 Dec 2020 22:13:34 -0500
X-MC-Unique: bsGc3wo6PHivHNPtnxOzUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C7D01005D44;
 Mon, 14 Dec 2020 03:13:33 +0000 (UTC)
Received: from [10.72.13.213] (ovpn-13-213.pek2.redhat.com [10.72.13.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC0AB709AA;
 Mon, 14 Dec 2020 03:13:26 +0000 (UTC)
Subject: Re: [PATCH net] vhost_net: fix high cpu load when sendmsg fails
To: wangyunjian <wangyunjian@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <1607514504-20956-1-git-send-email-wangyunjian@huawei.com>
 <20201209074832-mutt-send-email-mst@kernel.org>
 <34EFBCA9F01B0748BEB6B629CE643AE60DB61ADF@DGGEMM533-MBX.china.huawei.com>
 <f95f061c-dcac-9d56-94a0-50ef683946cd@redhat.com>
 <34EFBCA9F01B0748BEB6B629CE643AE60DB65468@DGGEMM533-MBX.china.huawei.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d3b6b081-97c6-d8e9-55cc-8b24bdd99483@redhat.com>
Date: Mon, 14 Dec 2020 11:13:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <34EFBCA9F01B0748BEB6B629CE643AE60DB65468@DGGEMM533-MBX.china.huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "Lilijun \(Jerry\)" <jerry.lilijun@huawei.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 chenchanghu <chenchanghu@huawei.com>,
 "huangbin \(J\)" <brian.huangbin@huawei.com>, xudingke <xudingke@huawei.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvMTIvMTEg5LiL5Y2IMzozNywgd2FuZ3l1bmppYW4gd3JvdGU6Cj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IEphc29uIFdhbmcgW21haWx0bzpqYXNvd2FuZ0By
ZWRoYXQuY29tXQo+PiBTZW50OiBGcmlkYXksIERlY2VtYmVyIDExLCAyMDIwIDEwOjUzIEFNCj4+
IFRvOiB3YW5neXVuamlhbiA8d2FuZ3l1bmppYW5AaHVhd2VpLmNvbT47IE1pY2hhZWwgUy4gVHNp
cmtpbgo+PiA8bXN0QHJlZGhhdC5jb20+Cj4+IENjOiB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZzsgbmV0ZGV2QHZnZXIua2VybmVsLm9yZzsgTGlsaWp1bgo+PiAoSmVy
cnkpIDxqZXJyeS5saWxpanVuQGh1YXdlaS5jb20+OyBjaGVuY2hhbmdodSA8Y2hlbmNoYW5naHVA
aHVhd2VpLmNvbT47Cj4+IHh1ZGluZ2tlIDx4dWRpbmdrZUBodWF3ZWkuY29tPgo+PiBTdWJqZWN0
OiBSZTogW1BBVENIIG5ldF0gdmhvc3RfbmV0OiBmaXggaGlnaCBjcHUgbG9hZCB3aGVuIHNlbmRt
c2cgZmFpbHMKPj4KPj4KPj4gT24gMjAyMC8xMi85IOS4i+WNiDk6MjcsIHdhbmd5dW5qaWFuIHdy
b3RlOgo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+Pj4gRnJvbTogTWljaGFlbCBT
LiBUc2lya2luIFttYWlsdG86bXN0QHJlZGhhdC5jb21dCj4+Pj4gU2VudDogV2VkbmVzZGF5LCBE
ZWNlbWJlciA5LCAyMDIwIDg6NTAgUE0KPj4+PiBUbzogd2FuZ3l1bmppYW4gPHdhbmd5dW5qaWFu
QGh1YXdlaS5jb20+Cj4+Pj4gQ2M6IGphc293YW5nQHJlZGhhdC5jb207IHZpcnR1YWxpemF0aW9u
QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnOwo+Pj4+IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc7
IExpbGlqdW4gKEplcnJ5KSA8amVycnkubGlsaWp1bkBodWF3ZWkuY29tPjsKPj4+PiBjaGVuY2hh
bmdodSA8Y2hlbmNoYW5naHVAaHVhd2VpLmNvbT47IHh1ZGluZ2tlCj4+IDx4dWRpbmdrZUBodWF3
ZWkuY29tPgo+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggbmV0XSB2aG9zdF9uZXQ6IGZpeCBoaWdo
IGNwdSBsb2FkIHdoZW4gc2VuZG1zZwo+Pj4+IGZhaWxzCj4+Pj4KPj4+PiBPbiBXZWQsIERlYyAw
OSwgMjAyMCBhdCAwNzo0ODoyNFBNICswODAwLCB3YW5neXVuamlhbiB3cm90ZToKPj4+Pj4gRnJv
bTogWXVuamlhbiBXYW5nIDx3YW5neXVuamlhbkBodWF3ZWkuY29tPgo+Pj4+Pgo+Pj4+PiBDdXJy
ZW50bHkgd2UgYnJlYWsgdGhlIGxvb3AgYW5kIHdha2UgdXAgdGhlIHZob3N0X3dvcmtlciB3aGVu
Cj4+Pj4+IHNlbmRtc2cgZmFpbHMuIFdoZW4gdGhlIHdvcmtlciB3YWtlcyB1cCBhZ2Fpbiwgd2Un
bGwgbWVldCB0aGUgc2FtZQo+Pj4+PiBlcnJvci4gVGhpcyB3aWxsIGNhdXNlIGhpZ2ggQ1BVIGxv
YWQuIFRvIGZpeCB0aGlzIGlzc3VlLCB3ZSBjYW4gc2tpcAo+Pj4+PiB0aGlzIGRlc2NyaXB0aW9u
IGJ5IGlnbm9yaW5nIHRoZSBlcnJvci4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogWXVuamlh
biBXYW5nIDx3YW5neXVuamlhbkBodWF3ZWkuY29tPgo+Pj4+PiAtLS0KPj4+Pj4gICAgZHJpdmVy
cy92aG9zdC9uZXQuYyB8IDI0ICsrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4+PiAgICAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvbmV0LmMgYi9kcml2ZXJzL3Zob3N0L25ldC5jIGlu
ZGV4Cj4+Pj4+IDUzMWEwMGQ3MDNjZC4uYWM5NTBiMTEyMGY1IDEwMDY0NAo+Pj4+PiAtLS0gYS9k
cml2ZXJzL3Zob3N0L25ldC5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMvdmhvc3QvbmV0LmMKPj4+Pj4g
QEAgLTgyOSwxNCArODI5LDggQEAgc3RhdGljIHZvaWQgaGFuZGxlX3R4X2NvcHkoc3RydWN0IHZo
b3N0X25ldAo+Pj4+PiAqbmV0LCBzdHJ1Y3Qgc29ja2V0ICpzb2NrKQo+Pj4+Pgo+Pj4+PiAgICAJ
CS8qIFRPRE86IENoZWNrIHNwZWNpZmljIGVycm9yIGFuZCBib21iIG91dCB1bmxlc3MgRU5PQlVG
Uz8KPj4gKi8KPj4+Pj4gICAgCQllcnIgPSBzb2NrLT5vcHMtPnNlbmRtc2coc29jaywgJm1zZywg
bGVuKTsKPj4+Pj4gLQkJaWYgKHVubGlrZWx5KGVyciA8IDApKSB7Cj4+Pj4+IC0JCQl2aG9zdF9k
aXNjYXJkX3ZxX2Rlc2ModnEsIDEpOwo+Pj4+PiAtCQkJdmhvc3RfbmV0X2VuYWJsZV92cShuZXQs
IHZxKTsKPj4+Pj4gLQkJCWJyZWFrOwo+Pj4+PiAtCQl9Cj4+Pj4+IC0JCWlmIChlcnIgIT0gbGVu
KQo+Pj4+PiAtCQkJcHJfZGVidWcoIlRydW5jYXRlZCBUWCBwYWNrZXQ6IGxlbiAlZCAhPSAlemRc
biIsCj4+Pj4+IC0JCQkJIGVyciwgbGVuKTsKPj4+Pj4gKwkJaWYgKHVubGlrZWx5KGVyciA8IDAg
fHwgZXJyICE9IGxlbikpCj4+Pj4+ICsJCQl2cV9lcnIodnEsICJGYWlsIHRvIHNlbmRpbmcgcGFj
a2V0cyBlcnIgOiAlZCwgbGVuIDogJXpkXG4iLAo+PiBlcnIsCj4+Pj4+ICtsZW4pOwo+Pj4+PiAg
ICBkb25lOgo+Pj4+PiAgICAJCXZxLT5oZWFkc1tudnEtPmRvbmVfaWR4XS5pZCA9IGNwdV90b192
aG9zdDMyKHZxLCBoZWFkKTsKPj4+Pj4gICAgCQl2cS0+aGVhZHNbbnZxLT5kb25lX2lkeF0ubGVu
ID0gMDsKPj4+PiBPbmUgb2YgdGhlIHJlYXNvbnMgZm9yIHNlbmRtc2cgdG8gZmFpbCBpcyBFTk9C
VUZTLgo+Pj4+IEluIHRoYXQgY2FzZSBmb3Igc3VyZSB3ZSBkb24ndCB3YW50IHRvIGRyb3AgcGFj
a2V0Lgo+Pj4gTm93IHRoZSBmdW5jdGlvbiB0YXBfc2VuZG1zZygpL3R1bl9zZW5kbXNnKCkgZG9u
J3QgcmV0dXJuIEVOT0JVRlMuCj4+Cj4+IEkgdGhpbmsgbm90LCBpdCBjYW4gaGFwcGVuIGlmIHdl
IGV4Y2VlZHMgc25kYnVmLiBFLmcgc2VlIHR1bl9hbGxvY19za2IoKS4KPiBUaGlzIHBhdGNoICdu
ZXQ6IGFkZCBhbGxvY19za2Jfd2l0aF9mcmFncygpIGhlbHBlcicgbW9kaWZ5cyB0aGUgcmV0dXJu
IHZhbHVlCj4gb2Ygc29ja19hbGxvY19zZW5kX3Bza2IoKSBmcm9tIC1FTk9CVUZTIHRvIC1FQUdB
SU4gd2hlbiB3ZSBleGNlZWRzIHNuZGJ1Zi4KPiBTbyB0aGUgcmV0dXJuIHZhbHVlIG9mIHR1bl9h
bGxvY19za2IgaGFzIGJlZW4gY2hhbmdlZC4KCgpPay4KCgo+Cj4gV2UgZG9uJ3QgZHJvcCBwYWNr
ZXQgaWYgdGhlIHJlYXNvbnMgZm9yIHNlbmRtc2cgdG8gZmFpbCBpcyBFQUdBSU4uCj4gSG93IGFi
b3V0IHRoaXM/CgoKSXQgc2hvdWxkIHdvcmsuCgpCdHcsIHRoZSBwYXRjaCBkb2Vzbid0IGFkZCB0
aGUgaGVhZCB0byB0aGUgdXNlZCByaW5nLiBUaGlzIG1heSBjb25mdXNlcyAKdGhlIGRyaXZlci4K
ClRoYW5rcwoKCj4KPiBUaGFua3MKPgo+PiBUaGFua3MKPj4KPj4KPj4+PiBUaGVyZSBjb3VsZCBi
ZSBvdGhlciB0cmFuc2llbnQgZXJyb3JzLgo+Pj4+IFdoaWNoIGVycm9yIGRpZCB5b3UgZW5jb3Vu
dGVyLCBzcGVjaWZpY2FsbHk/Cj4+PiBDdXJyZW50bHkgYSBndWVzdCB2bSBzZW5kIGEgc2tiIHdo
aWNoIGxlbmd0aCBpcyBtb3JlIHRoYW4gNjRrLgo+Pj4gSWYgdmlydGlvIGhkciBpcyB3cm9uZywg
dGhlIHByb2JsZW0gd2lsbCBhbHNvIGJlIHRyaWdnZXJlZC4KPj4+Cj4+PiBUaGFua3MKPj4+Cj4+
Pj4+IEBAIC05MjUsMTkgKzkxOSwxMSBAQCBzdGF0aWMgdm9pZCBoYW5kbGVfdHhfemVyb2NvcHko
c3RydWN0Cj4+Pj4+IHZob3N0X25ldCAqbmV0LCBzdHJ1Y3Qgc29ja2V0ICpzb2NrKQo+Pj4+Pgo+
Pj4+PiAgICAJCS8qIFRPRE86IENoZWNrIHNwZWNpZmljIGVycm9yIGFuZCBib21iIG91dCB1bmxl
c3MgRU5PQlVGUz8KPj4gKi8KPj4+Pj4gICAgCQllcnIgPSBzb2NrLT5vcHMtPnNlbmRtc2coc29j
aywgJm1zZywgbGVuKTsKPj4+Pj4gLQkJaWYgKHVubGlrZWx5KGVyciA8IDApKSB7Cj4+Pj4+IC0J
CQlpZiAoemNvcHlfdXNlZCkgewo+Pj4+PiArCQlpZiAodW5saWtlbHkoZXJyIDwgMCB8fCBlcnIg
IT0gbGVuKSkgewo+Pj4+PiArCQkJaWYgKHpjb3B5X3VzZWQgJiYgZXJyIDwgMCkKPj4+Pj4gICAg
CQkJCXZob3N0X25ldF91YnVmX3B1dCh1YnVmcyk7Cj4+Pj4+IC0JCQkJbnZxLT51cGVuZF9pZHgg
PSAoKHVuc2lnbmVkKW52cS0+dXBlbmRfaWR4IC0gMSkKPj4+Pj4gLQkJCQkJJSBVSU9fTUFYSU9W
Owo+Pj4+PiAtCQkJfQo+Pj4+PiAtCQkJdmhvc3RfZGlzY2FyZF92cV9kZXNjKHZxLCAxKTsKPj4+
Pj4gLQkJCXZob3N0X25ldF9lbmFibGVfdnEobmV0LCB2cSk7Cj4+Pj4+IC0JCQlicmVhazsKPj4+
Pj4gKwkJCXZxX2Vycih2cSwgIkZhaWwgdG8gc2VuZGluZyBwYWNrZXRzIGVyciA6ICVkLCBsZW4g
OiAlemRcbiIsCj4+IGVyciwKPj4+Pj4gK2xlbik7Cj4+Pj4+ICAgIAkJfQo+Pj4+PiAtCQlpZiAo
ZXJyICE9IGxlbikKPj4+Pj4gLQkJCXByX2RlYnVnKCJUcnVuY2F0ZWQgVFggcGFja2V0OiAiCj4+
Pj4+IC0JCQkJICIgbGVuICVkICE9ICV6ZFxuIiwgZXJyLCBsZW4pOwo+Pj4+PiAgICAJCWlmICgh
emNvcHlfdXNlZCkKPj4+Pj4gICAgCQkJdmhvc3RfYWRkX3VzZWRfYW5kX3NpZ25hbCgmbmV0LT5k
ZXYsIHZxLCBoZWFkLCAwKTsKPj4+Pj4gICAgCQllbHNlCj4+Pj4+IC0tCj4+Pj4+IDIuMjMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
