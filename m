Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB9C2D436
	for <lists.virtualization@lfdr.de>; Wed, 29 May 2019 05:24:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7526B23E8;
	Wed, 29 May 2019 03:24:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 26C15230C
	for <virtualization@lists.linux-foundation.org>;
	Wed, 29 May 2019 03:22:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B7A67619
	for <virtualization@lists.linux-foundation.org>;
	Wed, 29 May 2019 03:22:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D2D51308425C;
	Wed, 29 May 2019 03:22:51 +0000 (UTC)
Received: from [10.72.12.48] (ovpn-12-48.pek2.redhat.com [10.72.12.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D46731972B;
	Wed, 29 May 2019 03:22:42 +0000 (UTC)
Subject: Re: [PATCH 3/4] vsock/virtio: fix flush of works during the .remove()
To: Stefano Garzarella <sgarzare@redhat.com>, netdev@vger.kernel.org
References: <20190528105623.27983-1-sgarzare@redhat.com>
	<20190528105623.27983-4-sgarzare@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9ac9fc4b-5c39-2503-dfbb-660a7bdcfbfd@redhat.com>
Date: Wed, 29 May 2019 11:22:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528105623.27983-4-sgarzare@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 29 May 2019 03:22:51 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
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

Ck9uIDIwMTkvNS8yOCDkuIvljYg2OjU2LCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4gV2Ug
Zmx1c2ggYWxsIHBlbmRpbmcgd29ya3MgYmVmb3JlIHRvIGNhbGwgdmRldi0+Y29uZmlnLT5yZXNl
dCh2ZGV2KSwKPiBidXQgb3RoZXIgd29ya3MgY2FuIGJlIHF1ZXVlZCBiZWZvcmUgdGhlIHZkZXYt
PmNvbmZpZy0+ZGVsX3Zxcyh2ZGV2KSwKPiBzbyB3ZSBhZGQgYW5vdGhlciBmbHVzaCBhZnRlciBp
dCwgdG8gYXZvaWQgdXNlIGFmdGVyIGZyZWUuCj4KPiBTdWdnZXN0ZWQtYnk6IE1pY2hhZWwgUy4g
VHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBHYXJ6YXJl
bGxhIDxzZ2FyemFyZUByZWRoYXQuY29tPgo+IC0tLQo+ICAgbmV0L3Ztd192c29jay92aXJ0aW9f
dHJhbnNwb3J0LmMgfCAyMyArKysrKysrKysrKysrKysrKy0tLS0tLQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDE3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbmV0
L3Ztd192c29jay92aXJ0aW9fdHJhbnNwb3J0LmMgYi9uZXQvdm13X3Zzb2NrL3ZpcnRpb190cmFu
c3BvcnQuYwo+IGluZGV4IGU2OTRkZjEwYWI2MS4uYWQwOTNjZTk2NjkzIDEwMDY0NAo+IC0tLSBh
L25ldC92bXdfdnNvY2svdmlydGlvX3RyYW5zcG9ydC5jCj4gKysrIGIvbmV0L3Ztd192c29jay92
aXJ0aW9fdHJhbnNwb3J0LmMKPiBAQCAtNjYwLDYgKzY2MCwxNSBAQCBzdGF0aWMgaW50IHZpcnRp
b192c29ja19wcm9iZShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKPiAgIAlyZXR1cm4gcmV0
Owo+ICAgfQo+ICAgCj4gK3N0YXRpYyB2b2lkIHZpcnRpb192c29ja19mbHVzaF93b3JrcyhzdHJ1
Y3QgdmlydGlvX3Zzb2NrICp2c29jaykKPiArewo+ICsJZmx1c2hfd29yaygmdnNvY2stPmxvb3Bi
YWNrX3dvcmspOwo+ICsJZmx1c2hfd29yaygmdnNvY2stPnJ4X3dvcmspOwo+ICsJZmx1c2hfd29y
aygmdnNvY2stPnR4X3dvcmspOwo+ICsJZmx1c2hfd29yaygmdnNvY2stPmV2ZW50X3dvcmspOwo+
ICsJZmx1c2hfd29yaygmdnNvY2stPnNlbmRfcGt0X3dvcmspOwo+ICt9Cj4gKwo+ICAgc3RhdGlj
IHZvaWQgdmlydGlvX3Zzb2NrX3JlbW92ZShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKPiAg
IHsKPiAgIAlzdHJ1Y3QgdmlydGlvX3Zzb2NrICp2c29jayA9IHZkZXYtPnByaXY7Cj4gQEAgLTY2
OCwxMiArNjc3LDYgQEAgc3RhdGljIHZvaWQgdmlydGlvX3Zzb2NrX3JlbW92ZShzdHJ1Y3Qgdmly
dGlvX2RldmljZSAqdmRldikKPiAgIAltdXRleF9sb2NrKCZ0aGVfdmlydGlvX3Zzb2NrX211dGV4
KTsKPiAgIAl0aGVfdmlydGlvX3Zzb2NrID0gTlVMTDsKPiAgIAo+IC0JZmx1c2hfd29yaygmdnNv
Y2stPmxvb3BiYWNrX3dvcmspOwo+IC0JZmx1c2hfd29yaygmdnNvY2stPnJ4X3dvcmspOwo+IC0J
Zmx1c2hfd29yaygmdnNvY2stPnR4X3dvcmspOwo+IC0JZmx1c2hfd29yaygmdnNvY2stPmV2ZW50
X3dvcmspOwo+IC0JZmx1c2hfd29yaygmdnNvY2stPnNlbmRfcGt0X3dvcmspOwo+IC0KPiAgIAkv
KiBSZXNldCBhbGwgY29ubmVjdGVkIHNvY2tldHMgd2hlbiB0aGUgZGV2aWNlIGRpc2FwcGVhciAq
Lwo+ICAgCXZzb2NrX2Zvcl9lYWNoX2Nvbm5lY3RlZF9zb2NrZXQodmlydGlvX3Zzb2NrX3Jlc2V0
X3NvY2spOwo+ICAgCj4gQEAgLTY5MCw2ICs2OTMsOSBAQCBzdGF0aWMgdm9pZCB2aXJ0aW9fdnNv
Y2tfcmVtb3ZlKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+ICAgCXZzb2NrLT5ldmVudF9y
dW4gPSBmYWxzZTsKPiAgIAltdXRleF91bmxvY2soJnZzb2NrLT5ldmVudF9sb2NrKTsKPiAgIAo+
ICsJLyogRmx1c2ggYWxsIHBlbmRpbmcgd29ya3MgKi8KPiArCXZpcnRpb192c29ja19mbHVzaF93
b3Jrcyh2c29jayk7Cj4gKwo+ICAgCS8qIEZsdXNoIGFsbCBkZXZpY2Ugd3JpdGVzIGFuZCBpbnRl
cnJ1cHRzLCBkZXZpY2Ugd2lsbCBub3QgdXNlIGFueQo+ICAgCSAqIG1vcmUgYnVmZmVycy4KPiAg
IAkgKi8KPiBAQCAtNzI2LDYgKzczMiwxMSBAQCBzdGF0aWMgdm9pZCB2aXJ0aW9fdnNvY2tfcmVt
b3ZlKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+ICAgCS8qIERlbGV0ZSB2aXJ0cXVldWVz
IGFuZCBmbHVzaCBvdXRzdGFuZGluZyBjYWxsYmFja3MgaWYgYW55ICovCj4gICAJdmRldi0+Y29u
ZmlnLT5kZWxfdnFzKHZkZXYpOwo+ICAgCj4gKwkvKiBPdGhlciB3b3JrcyBjYW4gYmUgcXVldWVk
IGJlZm9yZSAnY29uZmlnLT5kZWxfdnFzKCknLCBzbyB3ZSBmbHVzaAo+ICsJICogYWxsIHdvcmtz
IGJlZm9yZSB0byBmcmVlIHRoZSB2c29jayBvYmplY3QgdG8gYXZvaWQgdXNlIGFmdGVyIGZyZWUu
Cj4gKwkgKi8KPiArCXZpcnRpb192c29ja19mbHVzaF93b3Jrcyh2c29jayk7CgoKU29tZSBxdWVz
dGlvbnMgYWZ0ZXIgYSBxdWljayBnbGFuY2U6CgoxKSBJdCBsb29rcyB0byBtZSB0aGF0IHRoZSB3
b3JrIGNvdWxkIGJlIHF1ZXVlZCBmcm9tIHRoZSBwYXRoIG9mIAp2c29ja190cmFuc3BvcnRfY2Fu
Y2VsX3BrdCgpIC4gSXMgdGhhdCBzeW5jaHJvbml6ZWQgaGVyZT8KCjIpIElmIHdlIGRlY2lkZSB0
byBmbHVzaCBhZnRlciBkZXZfdnFzKCksIGlzIHR4X3J1bi9yeF9ydW4vZXZlbnRfcnVuIApzdGls
bCBuZWVkZWQ/IEl0IGxvb2tzIHRvIG1lIHdlJ3ZlIGFscmVhZHkgZG9uZSBleGNlcHQgdGhhdCB3
ZSBuZWVkIApmbHVzaCByeF93b3JrIGluIHRoZSBlbmQgc2luY2Ugc2VuZF9wa3Rfd29yayBjYW4g
cmVxdWV1ZSByeF93b3JrLgoKVGhhbmtzCgoKPiArCj4gICAJa2ZyZWUodnNvY2spOwo+ICAgCW11
dGV4X3VubG9jaygmdGhlX3ZpcnRpb192c29ja19tdXRleCk7Cj4gICB9Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
