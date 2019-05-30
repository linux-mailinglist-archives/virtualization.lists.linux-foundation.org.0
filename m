Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8101E2F9E8
	for <lists.virtualization@lfdr.de>; Thu, 30 May 2019 11:57:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9DED337DF;
	Thu, 30 May 2019 09:57:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0F86737B9
	for <virtualization@lists.linux-foundation.org>;
	Thu, 30 May 2019 09:46:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 81275823
	for <virtualization@lists.linux-foundation.org>;
	Thu, 30 May 2019 09:46:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63E7C11549;
	Thu, 30 May 2019 09:46:29 +0000 (UTC)
Received: from [10.72.12.113] (ovpn-12-113.pek2.redhat.com [10.72.12.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 165EA79451;
	Thu, 30 May 2019 09:46:18 +0000 (UTC)
Subject: Re: [PATCH 3/4] vsock/virtio: fix flush of works during the .remove()
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20190528105623.27983-1-sgarzare@redhat.com>
	<20190528105623.27983-4-sgarzare@redhat.com>
	<9ac9fc4b-5c39-2503-dfbb-660a7bdcfbfd@redhat.com>
	<20190529105832.oz3sagbne5teq3nt@steredhat>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8c9998c8-1b9c-aac6-42eb-135fcb966187@redhat.com>
Date: Thu, 30 May 2019 17:46:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529105832.oz3sagbne5teq3nt@steredhat>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 30 May 2019 09:46:34 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
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

Ck9uIDIwMTkvNS8yOSDkuIvljYg2OjU4LCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4gT24g
V2VkLCBNYXkgMjksIDIwMTkgYXQgMTE6MjI6NDBBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAxOS81LzI4IOS4i+WNiDY6NTYsIFN0ZWZhbm8gR2FyemFyZWxsYSB3cm90ZToKPj4+
IFdlIGZsdXNoIGFsbCBwZW5kaW5nIHdvcmtzIGJlZm9yZSB0byBjYWxsIHZkZXYtPmNvbmZpZy0+
cmVzZXQodmRldiksCj4+PiBidXQgb3RoZXIgd29ya3MgY2FuIGJlIHF1ZXVlZCBiZWZvcmUgdGhl
IHZkZXYtPmNvbmZpZy0+ZGVsX3Zxcyh2ZGV2KSwKPj4+IHNvIHdlIGFkZCBhbm90aGVyIGZsdXNo
IGFmdGVyIGl0LCB0byBhdm9pZCB1c2UgYWZ0ZXIgZnJlZS4KPj4+Cj4+PiBTdWdnZXN0ZWQtYnk6
IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBT
dGVmYW5vIEdhcnphcmVsbGEgPHNnYXJ6YXJlQHJlZGhhdC5jb20+Cj4+PiAtLS0KPj4+ICAgIG5l
dC92bXdfdnNvY2svdmlydGlvX3RyYW5zcG9ydC5jIHwgMjMgKysrKysrKysrKysrKysrKystLS0t
LS0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9uZXQvdm13X3Zzb2NrL3ZpcnRpb190cmFuc3BvcnQuYyBi
L25ldC92bXdfdnNvY2svdmlydGlvX3RyYW5zcG9ydC5jCj4+PiBpbmRleCBlNjk0ZGYxMGFiNjEu
LmFkMDkzY2U5NjY5MyAxMDA2NDQKPj4+IC0tLSBhL25ldC92bXdfdnNvY2svdmlydGlvX3RyYW5z
cG9ydC5jCj4+PiArKysgYi9uZXQvdm13X3Zzb2NrL3ZpcnRpb190cmFuc3BvcnQuYwo+Pj4gQEAg
LTY2MCw2ICs2NjAsMTUgQEAgc3RhdGljIGludCB2aXJ0aW9fdnNvY2tfcHJvYmUoc3RydWN0IHZp
cnRpb19kZXZpY2UgKnZkZXYpCj4+PiAgICAJcmV0dXJuIHJldDsKPj4+ICAgIH0KPj4+ICtzdGF0
aWMgdm9pZCB2aXJ0aW9fdnNvY2tfZmx1c2hfd29ya3Moc3RydWN0IHZpcnRpb192c29jayAqdnNv
Y2spCj4+PiArewo+Pj4gKwlmbHVzaF93b3JrKCZ2c29jay0+bG9vcGJhY2tfd29yayk7Cj4+PiAr
CWZsdXNoX3dvcmsoJnZzb2NrLT5yeF93b3JrKTsKPj4+ICsJZmx1c2hfd29yaygmdnNvY2stPnR4
X3dvcmspOwo+Pj4gKwlmbHVzaF93b3JrKCZ2c29jay0+ZXZlbnRfd29yayk7Cj4+PiArCWZsdXNo
X3dvcmsoJnZzb2NrLT5zZW5kX3BrdF93b3JrKTsKPj4+ICt9Cj4+PiArCj4+PiAgICBzdGF0aWMg
dm9pZCB2aXJ0aW9fdnNvY2tfcmVtb3ZlKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+Pj4g
ICAgewo+Pj4gICAgCXN0cnVjdCB2aXJ0aW9fdnNvY2sgKnZzb2NrID0gdmRldi0+cHJpdjsKPj4+
IEBAIC02NjgsMTIgKzY3Nyw2IEBAIHN0YXRpYyB2b2lkIHZpcnRpb192c29ja19yZW1vdmUoc3Ry
dWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCj4+PiAgICAJbXV0ZXhfbG9jaygmdGhlX3ZpcnRpb192
c29ja19tdXRleCk7Cj4+PiAgICAJdGhlX3ZpcnRpb192c29jayA9IE5VTEw7Cj4+PiAtCWZsdXNo
X3dvcmsoJnZzb2NrLT5sb29wYmFja193b3JrKTsKPj4+IC0JZmx1c2hfd29yaygmdnNvY2stPnJ4
X3dvcmspOwo+Pj4gLQlmbHVzaF93b3JrKCZ2c29jay0+dHhfd29yayk7Cj4+PiAtCWZsdXNoX3dv
cmsoJnZzb2NrLT5ldmVudF93b3JrKTsKPj4+IC0JZmx1c2hfd29yaygmdnNvY2stPnNlbmRfcGt0
X3dvcmspOwo+Pj4gLQo+Pj4gICAgCS8qIFJlc2V0IGFsbCBjb25uZWN0ZWQgc29ja2V0cyB3aGVu
IHRoZSBkZXZpY2UgZGlzYXBwZWFyICovCj4+PiAgICAJdnNvY2tfZm9yX2VhY2hfY29ubmVjdGVk
X3NvY2tldCh2aXJ0aW9fdnNvY2tfcmVzZXRfc29jayk7Cj4+PiBAQCAtNjkwLDYgKzY5Myw5IEBA
IHN0YXRpYyB2b2lkIHZpcnRpb192c29ja19yZW1vdmUoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZk
ZXYpCj4+PiAgICAJdnNvY2stPmV2ZW50X3J1biA9IGZhbHNlOwo+Pj4gICAgCW11dGV4X3VubG9j
aygmdnNvY2stPmV2ZW50X2xvY2spOwo+Pj4gKwkvKiBGbHVzaCBhbGwgcGVuZGluZyB3b3JrcyAq
Lwo+Pj4gKwl2aXJ0aW9fdnNvY2tfZmx1c2hfd29ya3ModnNvY2spOwo+Pj4gKwo+Pj4gICAgCS8q
IEZsdXNoIGFsbCBkZXZpY2Ugd3JpdGVzIGFuZCBpbnRlcnJ1cHRzLCBkZXZpY2Ugd2lsbCBub3Qg
dXNlIGFueQo+Pj4gICAgCSAqIG1vcmUgYnVmZmVycy4KPj4+ICAgIAkgKi8KPj4+IEBAIC03MjYs
NiArNzMyLDExIEBAIHN0YXRpYyB2b2lkIHZpcnRpb192c29ja19yZW1vdmUoc3RydWN0IHZpcnRp
b19kZXZpY2UgKnZkZXYpCj4+PiAgICAJLyogRGVsZXRlIHZpcnRxdWV1ZXMgYW5kIGZsdXNoIG91
dHN0YW5kaW5nIGNhbGxiYWNrcyBpZiBhbnkgKi8KPj4+ICAgIAl2ZGV2LT5jb25maWctPmRlbF92
cXModmRldik7Cj4+PiArCS8qIE90aGVyIHdvcmtzIGNhbiBiZSBxdWV1ZWQgYmVmb3JlICdjb25m
aWctPmRlbF92cXMoKScsIHNvIHdlIGZsdXNoCj4+PiArCSAqIGFsbCB3b3JrcyBiZWZvcmUgdG8g
ZnJlZSB0aGUgdnNvY2sgb2JqZWN0IHRvIGF2b2lkIHVzZSBhZnRlciBmcmVlLgo+Pj4gKwkgKi8K
Pj4+ICsJdmlydGlvX3Zzb2NrX2ZsdXNoX3dvcmtzKHZzb2NrKTsKPj4KPj4gU29tZSBxdWVzdGlv
bnMgYWZ0ZXIgYSBxdWljayBnbGFuY2U6Cj4+Cj4+IDEpIEl0IGxvb2tzIHRvIG1lIHRoYXQgdGhl
IHdvcmsgY291bGQgYmUgcXVldWVkIGZyb20gdGhlIHBhdGggb2YKPj4gdnNvY2tfdHJhbnNwb3J0
X2NhbmNlbF9wa3QoKSAuIElzIHRoYXQgc3luY2hyb25pemVkIGhlcmU/Cj4+Cj4gQm90aCB2aXJ0
aW9fdHJhbnNwb3J0X3NlbmRfcGt0KCkgYW5kIHZzb2NrX3RyYW5zcG9ydF9jYW5jZWxfcGt0KCkg
Y2FuCj4gcXVldWUgd29yayBmcm9tIHRoZSB1cHBlciBsYXllciAoc29ja2V0KS4KPgo+IFNldHRp
bmcgdGhlX3ZpcnRpb192c29jayB0byBOVUxMLCBzaG91bGQgc3luY2hyb25pemUsIGJ1dCBhZnRl
ciBhIGNhcmVmdWwgbG9vawo+IGEgcmFyZSBpc3N1ZSBjb3VsZCBoYXBwZW46Cj4gd2UgYXJlIHNl
dHRpbmcgdGhlX3ZpcnRpb192c29jayB0byBOVUxMIGF0IHRoZSBzdGFydCBvZiAucmVtb3ZlKCkg
YW5kIHdlCj4gYXJlIGZyZWVpbmcgdGhlIG9iamVjdCBwb2ludGVkIGJ5IGl0IGF0IHRoZSBlbmQg
b2YgLnJlbW92ZSgpLCBzbwo+IHZpcnRpb190cmFuc3BvcnRfc2VuZF9wa3QoKSBvciB2c29ja190
cmFuc3BvcnRfY2FuY2VsX3BrdCgpIG1heSBzdGlsbCBiZQo+IHJ1bm5pbmcsIGFjY2Vzc2luZyB0
aGUgb2JqZWN0IHRoYXQgd2UgYXJlIGZyZWVkLgoKClllcywgdGhhdCdzIG15IHBvaW50LgoKCj4K
PiBTaG91bGQgSSB1c2Ugc29tZXRoaW5nIGxpa2UgUkNVIHRvIHByZXZlbnQgdGhpcyBpc3N1ZT8K
Pgo+ICAgICAgdmlydGlvX3RyYW5zcG9ydF9zZW5kX3BrdCgpIGFuZCB2c29ja190cmFuc3BvcnRf
Y2FuY2VsX3BrdCgpCj4gICAgICB7Cj4gICAgICAgICAgcmN1X3JlYWRfbG9jaygpOwo+ICAgICAg
ICAgIHZzb2NrID0gcmN1X2RlcmVmZXJlbmNlKHRoZV92aXJ0aW9fdnNvY2tfbXV0ZXgpOwoKClJD
VSBpcyBwcm9iYWJseSBhIHdheSB0byBnby4gKExpa2Ugd2hhdCB2aG9zdF90cmFuc3BvcnRfc2Vu
ZF9wa3QoKSBkaWQpLgoKCj4gICAgICAgICAgLi4uCj4gICAgICAgICAgcmN1X3JlYWRfdW5sb2Nr
KCk7Cj4gICAgICB9Cj4KPiAgICAgIHZpcnRpb192c29ja19yZW1vdmUoKQo+ICAgICAgewo+ICAg
ICAgICAgIHJjdV9hc3NpZ25fcG9pbnRlcih0aGVfdmlydGlvX3Zzb2NrX211dGV4LCBOVUxMKTsK
PiAgICAgICAgICBzeW5jaHJvbml6ZV9yY3UoKTsKPgo+ICAgICAgICAgIC4uLgo+Cj4gICAgICAg
ICAgZnJlZSh2c29jayk7Cj4gICAgICB9Cj4KPiBDb3VsZCB0aGVyZSBiZSBhIGJldHRlciBhcHBy
b2FjaD8KPgo+Cj4+IDIpIElmIHdlIGRlY2lkZSB0byBmbHVzaCBhZnRlciBkZXZfdnFzKCksIGlz
IHR4X3J1bi9yeF9ydW4vZXZlbnRfcnVuIHN0aWxsCj4+IG5lZWRlZD8gSXQgbG9va3MgdG8gbWUg
d2UndmUgYWxyZWFkeSBkb25lIGV4Y2VwdCB0aGF0IHdlIG5lZWQgZmx1c2ggcnhfd29yawo+PiBp
biB0aGUgZW5kIHNpbmNlIHNlbmRfcGt0X3dvcmsgY2FuIHJlcXVldWUgcnhfd29yay4KPiBUaGUg
bWFpbiByZWFzb24gb2YgdHhfcnVuL3J4X3J1bi9ldmVudF9ydW4gaXMgdG8gcHJldmVudCB0aGF0
IGEgd29ya2VyCj4gZnVuY3Rpb24gaXMgcnVubmluZyB3aGlsZSB3ZSBhcmUgY2FsbGluZyBjb25m
aWctPnJlc2V0KCkuCj4KPiBFLmcuIGlmIGFuIGludGVycnVwdCBjb21lcyBiZXR3ZWVuIHZpcnRp
b192c29ja19mbHVzaF93b3JrcygpIGFuZAo+IGNvbmZpZy0+cmVzZXQoKSwgaXQgY2FuIHF1ZXVl
IG5ldyB3b3JrcyB0aGF0IGNhbiBhY2Nlc3MgdGhlIGRldmljZSB3aGlsZQo+IHdlIGFyZSBpbiBj
b25maWctPnJlc2V0KCkuCj4KPiBJTUhPIHRoZXkgYXJlIHN0aWxsIG5lZWRlZC4KPgo+IFdoYXQg
ZG8geW91IHRoaW5rPwoKCkkgbWVhbiBjb3VsZCB3ZSBzaW1wbHkgZG8gZmx1c2ggYWZ0ZXIgcmVz
ZXQgb25jZSBhbmQgd2l0aG91dCAKdHhfcngvcnhfcnVuIHRyaWNrcz8KCnJlc3QoKTsKCnZpcnRp
b192c29ja19mbHVzaF93b3JrKCk7Cgp2aXJ0aW9fdnNvY2tfZnJlZV9idWYoKTsKCgpUaGFua3MK
Cgo+Cj4KPiBUaGFua3MgZm9yIHlvdXIgcXVlc3Rpb25zLAo+IFN0ZWZhbm8KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
