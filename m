Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 23855D5970
	for <lists.virtualization@lfdr.de>; Mon, 14 Oct 2019 03:56:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3D8F224F3;
	Mon, 14 Oct 2019 01:56:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3A3D824DB
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 01:43:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AC4816CE
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 01:43:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E17F7883837;
	Mon, 14 Oct 2019 01:43:31 +0000 (UTC)
Received: from [10.72.12.117] (ovpn-12-117.pek2.redhat.com [10.72.12.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 44BCC5D6A3;
	Mon, 14 Oct 2019 01:43:26 +0000 (UTC)
Subject: Re: [PATCH RFC v1 1/2] vhost: option to fetch descriptors through an
	independent struct
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20191011134358.16912-1-mst@redhat.com>
	<20191011134358.16912-2-mst@redhat.com>
	<3b2a6309-9d21-7172-a581-9f0f1d5c1427@redhat.com>
	<20191012162445-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <fea337ec-7c09-508b-3efa-b75afd6fe33b@redhat.com>
Date: Mon, 14 Oct 2019 09:43:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191012162445-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.69]);
	Mon, 14 Oct 2019 01:43:31 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvMTAvMTMg5LiK5Y2INDoyNywgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IE9u
IFNhdCwgT2N0IDEyLCAyMDE5IGF0IDAzOjI4OjQ5UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6
Cj4+IE9uIDIwMTkvMTAvMTEg5LiL5Y2IOTo0NSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+
Pj4gVGhlIGlkZWEgaXMgdG8gc3VwcG9ydCBtdWx0aXBsZSByaW5nIGZvcm1hdHMgYnkgY29udmVy
dGluZwo+Pj4gdG8gYSBmb3JtYXQtaW5kZXBlbmRlbnQgYXJyYXkgb2YgZGVzY3JpcHRvcnMuCj4+
Pgo+Pj4gVGhpcyBjb3N0cyBleHRyYSBjeWNsZXMsIGJ1dCB3ZSBnYWluIGluIGFiaWxpdHkKPj4+
IHRvIGZldGNoIGEgYmF0Y2ggb2YgZGVzY3JpcHRvcnMgaW4gb25lIGdvLCB3aGljaAo+Pj4gaXMg
Z29vZCBmb3IgY29kZSBjYWNoZSBsb2NhbGl0eS4KPj4+Cj4+PiBUbyBzaW1wbGlmeSBiZW5jaG1h
cmtpbmcsIEkga2VwdCB0aGUgb2xkIGNvZGUKPj4+IGFyb3VuZCBzbyBvbmUgY2FuIHN3aXRjaCBi
YWNrIGFuZCBmb3J0aCBieQo+Pj4gd3JpdGluZyBpbnRvIGEgbW9kdWxlIHBhcmFtZXRlci4KPj4+
IFRoaXMgd2lsbCBnbyBhd2F5IGluIHRoZSBmaW5hbCBzdWJtaXNzaW9uLgo+Pj4KPj4+IFRoaXMg
cGF0Y2ggY2F1c2VzIGEgbWlub3IgcGVyZm9ybWFuY2UgZGVncmFkYXRpb24sCj4+PiBpdCdzIGJl
ZW4ga2VwdCBhcyBzaW1wbGUgYXMgcG9zc2libGUgZm9yIGVhc2Ugb2YgcmV2aWV3Lgo+Pj4gTmV4
dCBwYXRjaCBnZXRzIHVzIGJhY2sgdGhlIHBlcmZvcm1hbmNlIGJ5IGFkZGluZyBiYXRjaGluZy4K
Pj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29t
Pgo+Pj4gLS0tCj4+PiAgICBkcml2ZXJzL3Zob3N0L3Rlc3QuYyAgfCAgMTcgKystCj4+PiAgICBk
cml2ZXJzL3Zob3N0L3Zob3N0LmMgfCAyOTkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystCj4+PiAgICBkcml2ZXJzL3Zob3N0L3Zob3N0LmggfCAgMTYgKysrCj4+PiAg
ICAzIGZpbGVzIGNoYW5nZWQsIDMyNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3Rlc3QuYyBiL2RyaXZlcnMvdmhvc3QvdGVz
dC5jCj4+PiBpbmRleCAwNTYzMDgwMDgyODguLjM5YTAxOGE3YWYyZCAxMDA2NDQKPj4+IC0tLSBh
L2RyaXZlcnMvdmhvc3QvdGVzdC5jCj4+PiArKysgYi9kcml2ZXJzL3Zob3N0L3Rlc3QuYwo+Pj4g
QEAgLTE4LDYgKzE4LDkgQEAKPj4+ICAgICNpbmNsdWRlICJ0ZXN0LmgiCj4+PiAgICAjaW5jbHVk
ZSAidmhvc3QuaCIKPj4+ICtzdGF0aWMgaW50IG5ld2NvZGUgPSAwOwo+Pj4gK21vZHVsZV9wYXJh
bShuZXdjb2RlLCBpbnQsIDA2NDQpOwo+Pj4gKwo+Pj4gICAgLyogTWF4IG51bWJlciBvZiBieXRl
cyB0cmFuc2ZlcnJlZCBiZWZvcmUgcmVxdWV1ZWluZyB0aGUgam9iLgo+Pj4gICAgICogVXNpbmcg
dGhpcyBsaW1pdCBwcmV2ZW50cyBvbmUgdmlydHF1ZXVlIGZyb20gc3RhcnZpbmcgb3RoZXJzLiAq
Lwo+Pj4gICAgI2RlZmluZSBWSE9TVF9URVNUX1dFSUdIVCAweDgwMDAwCj4+PiBAQCAtNTgsMTAg
KzYxLDE2IEBAIHN0YXRpYyB2b2lkIGhhbmRsZV92cShzdHJ1Y3Qgdmhvc3RfdGVzdCAqbikKPj4+
ICAgIAl2aG9zdF9kaXNhYmxlX25vdGlmeSgmbi0+ZGV2LCB2cSk7Cj4+PiAgICAJZm9yICg7Oykg
ewo+Pj4gLQkJaGVhZCA9IHZob3N0X2dldF92cV9kZXNjKHZxLCB2cS0+aW92LAo+Pj4gLQkJCQkJ
IEFSUkFZX1NJWkUodnEtPmlvdiksCj4+PiAtCQkJCQkgJm91dCwgJmluLAo+Pj4gLQkJCQkJIE5V
TEwsIE5VTEwpOwo+Pj4gKwkJaWYgKG5ld2NvZGUpCj4+PiArCQkJaGVhZCA9IHZob3N0X2dldF92
cV9kZXNjX2JhdGNoKHZxLCB2cS0+aW92LAo+Pj4gKwkJCQkJCSAgICAgICBBUlJBWV9TSVpFKHZx
LT5pb3YpLAo+Pj4gKwkJCQkJCSAgICAgICAmb3V0LCAmaW4sCj4+PiArCQkJCQkJICAgICAgIE5V
TEwsIE5VTEwpOwo+Pj4gKwkJZWxzZQo+Pj4gKwkJCWhlYWQgPSB2aG9zdF9nZXRfdnFfZGVzYyh2
cSwgdnEtPmlvdiwKPj4+ICsJCQkJCQkgQVJSQVlfU0laRSh2cS0+aW92KSwKPj4+ICsJCQkJCQkg
Jm91dCwgJmluLAo+Pj4gKwkJCQkJCSBOVUxMLCBOVUxMKTsKPj4+ICAgIAkJLyogT24gZXJyb3Is
IHN0b3AgaGFuZGxpbmcgdW50aWwgdGhlIG5leHQga2ljay4gKi8KPj4+ICAgIAkJaWYgKHVubGlr
ZWx5KGhlYWQgPCAwKSkKPj4+ICAgIAkJCWJyZWFrOwo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmhvc3Qvdmhvc3QuYyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+Pj4gaW5kZXggMzZjYTJjZjQx
OWJmLi4zNjY2MWQ2Y2I1MWYgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmMK
Pj4+ICsrKyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+Pj4gQEAgLTMwMSw2ICszMDEsNyBAQCBz
dGF0aWMgdm9pZCB2aG9zdF92cV9yZXNldChzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsCj4+PiAgICAJ
CQkgICBzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSkKPj4+ICAgIHsKPj4+ICAgIAl2cS0+bnVt
ID0gMTsKPj4+ICsJdnEtPm5kZXNjcyA9IDA7Cj4+PiAgICAJdnEtPmRlc2MgPSBOVUxMOwo+Pj4g
ICAgCXZxLT5hdmFpbCA9IE5VTEw7Cj4+PiAgICAJdnEtPnVzZWQgPSBOVUxMOwo+Pj4gQEAgLTM2
OSw2ICszNzAsOSBAQCBzdGF0aWMgaW50IHZob3N0X3dvcmtlcih2b2lkICpkYXRhKQo+Pj4gICAg
c3RhdGljIHZvaWQgdmhvc3RfdnFfZnJlZV9pb3ZlY3Moc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAq
dnEpCj4+PiAgICB7Cj4+PiArCWtmcmVlKHZxLT5kZXNjcyk7Cj4+PiArCXZxLT5kZXNjcyA9IE5V
TEw7Cj4+PiArCXZxLT5tYXhfZGVzY3MgPSAwOwo+Pj4gICAgCWtmcmVlKHZxLT5pbmRpcmVjdCk7
Cj4+PiAgICAJdnEtPmluZGlyZWN0ID0gTlVMTDsKPj4+ICAgIAlrZnJlZSh2cS0+bG9nKTsKPj4+
IEBAIC0zODUsNiArMzg5LDEwIEBAIHN0YXRpYyBsb25nIHZob3N0X2Rldl9hbGxvY19pb3ZlY3Mo
c3RydWN0IHZob3N0X2RldiAqZGV2KQo+Pj4gICAgCWZvciAoaSA9IDA7IGkgPCBkZXYtPm52cXM7
ICsraSkgewo+Pj4gICAgCQl2cSA9IGRldi0+dnFzW2ldOwo+Pj4gKwkJdnEtPm1heF9kZXNjcyA9
IGRldi0+aW92X2xpbWl0Owo+Pj4gKwkJdnEtPmRlc2NzID0ga21hbGxvY19hcnJheSh2cS0+bWF4
X2Rlc2NzLAo+Pj4gKwkJCQkJICBzaXplb2YoKnZxLT5kZXNjcyksCj4+PiArCQkJCQkgIEdGUF9L
RVJORUwpOwo+Pgo+PiBJcyBpb3ZfbGltaXQgdG9vIG11Y2ggaGVyZT8gSXQgY2FuIG9idmlvdXNs
eSBpbmNyZWFzZSB0aGUgZm9vdHByaW50LiBJIGd1ZXNzCj4+IHRoZSBiYXRjaGluZyBjYW4gb25s
eSBiZSBkb25lIGZvciBkZXNjcmlwdG9yIHdpdGhvdXQgaW5kaXJlY3Qgb3IgbmV4dCBzZXQuCj4+
IFRoZW4gd2UgbWF5IGJhdGNoIDE2IG9yIDY0Lgo+Pgo+PiBUaGFua3MKPiBZZXMsIG5leHQgcGF0
Y2ggb25seSBiYXRjaGVzIHVwIHRvIDY0LiAgQnV0IHdlIGRvIG5lZWQgaW92X2xpbWl0IGJlY2F1
c2UKPiBndWVzdCBjYW4gcGFzcyBhIGxvbmcgY2hhaW4gb2Ygc2NhdHRlci9nYXRoZXIuCj4gV2Ug
YWxyZWFkeSBoYXZlIGlvdmVjcyBpbiBhIGh1Z2UgYXJyYXkgc28gdGhpcyBkb2VzIG5vdCBsb29r
IGxpa2UKPiBhIGJpZyBkZWFsLiBJZiB3ZSBldmVyIHRlYWNoIHRoZSBjb2RlIHRvIGF2b2lkIHRo
ZSBodWdlCj4gaW92IGFycmF5cyBieSBoYW5kbGluZyBodWdlIHMvZyBsaXN0cyBwaWVjZSBieSBw
aWVjZSwKPiB3ZSBjYW4gbWFrZSB0aGUgZGVzYyBhcnJheSBzbWFsbGVyIGF0IHRoZSBzYW1lIHBv
aW50Lgo+CgpBbm90aGVyIHBvc3NpYmxlIGlzc3VlLCBpZiB3ZSB0cnkgdG8gYmF0Y2ggZGVzY3Jp
cHRvciBjaGFpbiB3aGVuIHdlJ3ZlIAphbHJlYWR5IGJhdGNoZWQgc29tZSBkZXNjcmlwdG9ycywg
d2UgbWF5IHJlYWNoIHRoZSBsaW1pdCB0aGVuIHNvbWUgb2YgCnRoZSBkZXNjcmlwdG9ycyBtaWdo
dCBuZWVkIHJlLXJlYWQuCgpPciB3ZSBtYXkgbmVlZCBjaXJjdWxhciBpbmRleCAoaGVhZCwgdGFp
bCkgaW4gdGhpcyBjYXNlPwoKVGhhbmtzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
