Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A892304B2
	for <lists.virtualization@lfdr.de>; Tue, 28 Jul 2020 09:53:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5554884E55;
	Tue, 28 Jul 2020 07:53:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mm8XpTgbt4xn; Tue, 28 Jul 2020 07:53:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F034685008;
	Tue, 28 Jul 2020 07:53:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2995C004D;
	Tue, 28 Jul 2020 07:53:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0EBBEC004D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 07:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F18B7228B4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 07:53:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id negMs4ICkNx5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 07:53:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id EB57120531
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 07:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595922809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SpGirkBctXwJWEHbPAg/cQrnslbOJaO9rpYq2tSoDpk=;
 b=h05D77Y0AgvpidD0qaycTgImlbfw+eFQK7V/gaLWmJ9c7X75dEzsRBRjTA3GD85ifQ4KS1
 Ij15UfBmM2cRuyppxbx815hhsNWsdhZOroKs91oSVUIyIyKYfy82GZ2NP3VIsRLCUNGeum
 GZlV9i8JIyqEsYhNhlNGV/Z6qgiDebM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-dZoHkNqJPP6wKPerf9-rfQ-1; Tue, 28 Jul 2020 03:53:27 -0400
X-MC-Unique: dZoHkNqJPP6wKPerf9-rfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1460018C63C0;
 Tue, 28 Jul 2020 07:53:26 +0000 (UTC)
Received: from [10.72.13.242] (ovpn-13-242.pek2.redhat.com [10.72.13.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59977619C4;
 Tue, 28 Jul 2020 07:53:13 +0000 (UTC)
Subject: Re: [PATCH V4 4/6] vhost_vdpa: implement IRQ offloading in vhost_vdpa
To: Zhu Lingshan <lingshan.zhu@intel.com>, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, sean.j.christopherson@intel.com,
 wanpengli@tencent.com
References: <20200728042405.17579-1-lingshan.zhu@intel.com>
 <20200728042405.17579-5-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <10dd83c0-f68a-ed9e-9860-45c215fc67f6@redhat.com>
Date: Tue, 28 Jul 2020 15:53:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728042405.17579-5-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: shahafs@mellanox.com, parav@mellanox.com, kvm@vger.kernel.org,
 netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
 eli@mellanox.com
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

Ck9uIDIwMjAvNy8yOCDkuIvljYgxMjoyNCwgWmh1IExpbmdzaGFuIHdyb3RlOgo+IFRoaXMgcGF0
Y2ggaW50cm9kdWNlIGEgc2V0IG9mIGZ1bmN0aW9ucyBmb3Igc2V0dXAvdW5zZXR1cAo+IGFuZCB1
cGRhdGUgaXJxIG9mZmxvYWRpbmcgcmVzcGVjdGl2ZWx5IGJ5IHJlZ2lzdGVyL3VucmVnaXN0ZXIK
PiBhbmQgcmUtcmVnaXN0ZXIgdGhlIGlycV9ieXBhc3NfcHJvZHVjZXIuCj4KPiBXaXRoIHRoZXNl
IGZ1bmN0aW9ucywgdGhpcyBjb21taXQgY2FuIHNldHVwL3Vuc2V0dXAKPiBpcnEgb2ZmbG9hZGlu
ZyB0aHJvdWdoIHNldHRpbmcgRFJJVkVSX09LLyFEUklWRVJfT0ssIGFuZAo+IHVwZGF0ZSBpcnEg
b2ZmbG9hZGluZyB0aHJvdWdoIFNFVF9WUklOR19DQUxMLgo+Cj4gU2lnbmVkLW9mZi1ieTogWmh1
IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPgo+IFN1Z2dlc3RlZC1ieTogSmFzb24g
V2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvdmhvc3QvS2NvbmZp
ZyB8ICAxICsKPiAgIGRyaXZlcnMvdmhvc3QvdmRwYS5jICB8IDc5ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNzkgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvS2Nv
bmZpZyBiL2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+IGluZGV4IGQzNjg4YzZhZmI4Ny4uNTg3ZmJh
ZTA2MTgyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+ICsrKyBiL2RyaXZl
cnMvdmhvc3QvS2NvbmZpZwo+IEBAIC02NSw2ICs2NSw3IEBAIGNvbmZpZyBWSE9TVF9WRFBBCj4g
ICAJdHJpc3RhdGUgIlZob3N0IGRyaXZlciBmb3IgdkRQQS1iYXNlZCBiYWNrZW5kIgo+ICAgCWRl
cGVuZHMgb24gRVZFTlRGRAo+ICAgCXNlbGVjdCBWSE9TVAo+ICsJc2VsZWN0IElSUV9CWVBBU1Nf
TUFOQUdFUgo+ICAgCWRlcGVuZHMgb24gVkRQQQo+ICAgCWhlbHAKPiAgIAkgIFRoaXMga2VybmVs
IG1vZHVsZSBjYW4gYmUgbG9hZGVkIGluIGhvc3Qga2VybmVsIHRvIGFjY2VsZXJhdGUKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy92aG9zdC92ZHBhLmMgYi9kcml2ZXJzL3Zob3N0L3ZkcGEuYwo+IGlu
ZGV4IGRmM2NmMzg2YjBjZC4uMWRjY2NlZDMyMWY4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmhv
c3QvdmRwYS5jCj4gKysrIGIvZHJpdmVycy92aG9zdC92ZHBhLmMKPiBAQCAtMTE1LDYgKzExNSw1
NSBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qgdmhvc3RfdmRwYV9jb25maWdfY2Iodm9pZCAqcHJpdmF0
ZSkKPiAgIAlyZXR1cm4gSVJRX0hBTkRMRUQ7Cj4gICB9Cj4gICAKPiArc3RhdGljIHZvaWQgdmhv
c3RfdmRwYV9zZXR1cF92cV9pcnEoc3RydWN0IHZob3N0X3ZkcGEgKnYsIGludCBxaWQpCj4gK3sK
PiArCXN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxID0gJnYtPnZxc1txaWRdOwo+ICsJY29uc3Qg
c3RydWN0IHZkcGFfY29uZmlnX29wcyAqb3BzID0gdi0+dmRwYS0+Y29uZmlnOwo+ICsJc3RydWN0
IHZkcGFfZGV2aWNlICp2ZHBhID0gdi0+dmRwYTsKPiArCWludCByZXQsIGlycTsKPiArCj4gKwlz
cGluX2xvY2soJnZxLT5jYWxsX2N0eC5jdHhfbG9jayk7Cj4gKwlpcnEgPSBvcHMtPmdldF92cV9p
cnEodmRwYSwgcWlkKTsKPiArCWlmICghdnEtPmNhbGxfY3R4LmN0eCB8fCBpcnEgPT0gLUVJTlZB
TCkgewoKCkl0J3MgYmV0dGVyIHRvIGNoZWNrIHJldHVybmVkIGlycSBhcyAiaXJxIDwgMCIgdG8g
YmUgbW9yZSByb2J1c3QuIApGb3JjaW5nIGEgc3BlY2lmaWMgZXJybm8gdmFsdWUgaXMgbm90IGdv
b2QuCgoKPiArCQlzcGluX3VubG9jaygmdnEtPmNhbGxfY3R4LmN0eF9sb2NrKTsKPiArCQlyZXR1
cm47Cj4gKwl9Cj4gKwo+ICsJdnEtPmNhbGxfY3R4LnByb2R1Y2VyLnRva2VuID0gdnEtPmNhbGxf
Y3R4LmN0eDsKPiArCXZxLT5jYWxsX2N0eC5wcm9kdWNlci5pcnEgPSBpcnE7Cj4gKwlyZXQgPSBp
cnFfYnlwYXNzX3JlZ2lzdGVyX3Byb2R1Y2VyKCZ2cS0+Y2FsbF9jdHgucHJvZHVjZXIpOwo+ICsJ
c3Bpbl91bmxvY2soJnZxLT5jYWxsX2N0eC5jdHhfbG9jayk7Cj4gK30KPiArCj4gK3N0YXRpYyB2
b2lkIHZob3N0X3ZkcGFfdW5zZXR1cF92cV9pcnEoc3RydWN0IHZob3N0X3ZkcGEgKnYsIGludCBx
aWQpCj4gK3sKPiArCXN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxID0gJnYtPnZxc1txaWRdOwo+
ICsKPiArCXNwaW5fbG9jaygmdnEtPmNhbGxfY3R4LmN0eF9sb2NrKTsKPiArCWlycV9ieXBhc3Nf
dW5yZWdpc3Rlcl9wcm9kdWNlcigmdnEtPmNhbGxfY3R4LnByb2R1Y2VyKTsKPiArCXNwaW5fdW5s
b2NrKCZ2cS0+Y2FsbF9jdHguY3R4X2xvY2spOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCB2aG9z
dF92ZHBhX3VwZGF0ZV92cV9pcnEoc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEpCj4gK3sKPiAr
CXNwaW5fbG9jaygmdnEtPmNhbGxfY3R4LmN0eF9sb2NrKTsKPiArCS8qCj4gKwkgKiBpZiBpdCBo
YXMgYSBub24temVybyBpcnEsIG1lYW5zIHRoZXJlIGlzIGEKPiArCSAqIHByZXZpc291bHkgcmVn
aXN0ZXJlZCBpcnFfYnlwYXNzX3Byb2R1Y2VyLAo+ICsJICogd2Ugc2hvdWxkIHVwZGF0ZSBpdCB3
aGVuIGN0eCAoaXRzIHRva2VuKQo+ICsJICogY2hhbmdlcy4KPiArCSAqLwo+ICsJaWYgKCF2cS0+
Y2FsbF9jdHgucHJvZHVjZXIuaXJxKSB7Cj4gKwkJc3Bpbl91bmxvY2soJnZxLT5jYWxsX2N0eC5j
dHhfbG9jayk7Cj4gKwkJcmV0dXJuOwo+ICsJfQo+ICsKPiArCWlycV9ieXBhc3NfdW5yZWdpc3Rl
cl9wcm9kdWNlcigmdnEtPmNhbGxfY3R4LnByb2R1Y2VyKTsKPiArCXZxLT5jYWxsX2N0eC5wcm9k
dWNlci50b2tlbiA9IHZxLT5jYWxsX2N0eC5jdHg7Cj4gKwlpcnFfYnlwYXNzX3JlZ2lzdGVyX3By
b2R1Y2VyKCZ2cS0+Y2FsbF9jdHgucHJvZHVjZXIpOwo+ICsJc3Bpbl91bmxvY2soJnZxLT5jYWxs
X2N0eC5jdHhfbG9jayk7Cj4gK30KPiArCj4gICBzdGF0aWMgdm9pZCB2aG9zdF92ZHBhX3Jlc2V0
KHN0cnVjdCB2aG9zdF92ZHBhICp2KQo+ICAgewo+ICAgCXN0cnVjdCB2ZHBhX2RldmljZSAqdmRw
YSA9IHYtPnZkcGE7Cj4gQEAgLTE1NSwxMSArMjA0LDE1IEBAIHN0YXRpYyBsb25nIHZob3N0X3Zk
cGFfc2V0X3N0YXR1cyhzdHJ1Y3Qgdmhvc3RfdmRwYSAqdiwgdTggX191c2VyICpzdGF0dXNwKQo+
ICAgewo+ICAgCXN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYSA9IHYtPnZkcGE7Cj4gICAJY29uc3Qg
c3RydWN0IHZkcGFfY29uZmlnX29wcyAqb3BzID0gdmRwYS0+Y29uZmlnOwo+IC0JdTggc3RhdHVz
Owo+ICsJdTggc3RhdHVzLCBzdGF0dXNfb2xkOwo+ICsJaW50IGksIG52cXM7Cj4gICAKPiAgIAlp
ZiAoY29weV9mcm9tX3VzZXIoJnN0YXR1cywgc3RhdHVzcCwgc2l6ZW9mKHN0YXR1cykpKQo+ICAg
CQlyZXR1cm4gLUVGQVVMVDsKPiAgIAo+ICsJc3RhdHVzX29sZCA9IG9wcy0+Z2V0X3N0YXR1cyh2
ZHBhKTsKPiArCW52cXMgPSB2LT5udnFzOwo+ICsKPiAgIAkvKgo+ICAgCSAqIFVzZXJzcGFjZSBz
aG91bGRuJ3QgcmVtb3ZlIHN0YXR1cyBiaXRzIHVubGVzcyByZXNldCB0aGUKPiAgIAkgKiBzdGF0
dXMgdG8gMC4KPiBAQCAtMTY3LDYgKzIyMCwxNSBAQCBzdGF0aWMgbG9uZyB2aG9zdF92ZHBhX3Nl
dF9zdGF0dXMoc3RydWN0IHZob3N0X3ZkcGEgKnYsIHU4IF9fdXNlciAqc3RhdHVzcCkKPiAgIAlp
ZiAoc3RhdHVzICE9IDAgJiYgKG9wcy0+Z2V0X3N0YXR1cyh2ZHBhKSAmIH5zdGF0dXMpICE9IDAp
Cj4gICAJCXJldHVybiAtRUlOVkFMOwo+ICAgCj4gKwkvKiB2cSBpcnEgaXMgbm90IGV4cGVjdGVk
IHRvIGJlIGNoYW5nZWQgb25jZSBEUklWRVJfT0sgaXMgc2V0ICovCgoKU28gdGhpcyBiYXNpY2Fs
bHkgbGltaXQgdGhlIHVzYWdlIG9mIGdldF92cV9pcnEoKSBpbiB0aGUgY29udGV4dCAKdmhvc3Rf
dmRwYV9zZXRfc3RhdHVzKCkgYW5kIG90aGVyIHZEUEEgYnVzIGRyaXZlcnMnIHNldF9zdGF0dXMo
KS4gSWYgCnRoaXMgaXMgdHJ1ZSwgdGhlcmUncyBldmVuIG5vIG5lZWQgdG8gaW50cm9kdWNlIGFu
eSBuZXcgY29uZmlnIG9wcyBidXQgCmp1c3QgbGV0IHNldF9zdGF0dXMoKSB0byByZXR1cm4gdGhl
IGlycXMgdXNlZCBmb3IgdGhlIGRldmljZS4gT3IgaWYgd2UgCndhbnQgdGhpcyB0byBiZSBtb3Jl
IGdlbmVyaWMsIHdlIG5lZWQgdnBkYSdzIG93biBpcnEgbWFuYWdlciAod2hpY2ggCnNob3VsZCBi
ZSBzaW1pbGFyIHRvIGlycSBieXBhc3MgbWFuYWdlcikuIFRoYXQgaXM6CgotIGJ1cyBkcml2ZXIg
Y2FuIHJlZ2lzdGVyIGl0c2VsZiBhcyBjb25zdW1lcgotIHZEUEEgZGV2aWNlIGRyaXZlciBjYW4g
cmVnaXN0ZXIgaXRzZWxmIGFzIHByb2R1Y2VyCi0gbWF0Y2hpbmcgdmlhIHF1ZXVlIGluZGV4Ci0g
ZGVhbCB3aXRoIHJlZ2lzdGVyaW5nL3VucmVnaXN0ZXJpbmcgb2YgY29uc3VtZXIvcHJvZHVjZXIK
ClNvIHRoZXJlJ3Mgbm8gbmVlZCB0byBjYXJlIHdoZW4gb3Igd2hlcmUgdGhlIHZEUEEgZGV2aWNl
IGRyaXZlciB0byAKYWxsb2NhdGUgdGhlIGlycSwgYW5kIHdlIGRvbid0IG5lZWQgdG8gY2FyZSBh
dCB3aGljaCBjb250ZXh0IHRoZSB2RFBBIApidXMgZHJpdmVyIGNhbiB1c2UgdGhlIGlycS4gRWl0
aGVyIHNpZGUgbWF5IGdldCBub3RpZmllZCB3aGVuIHRoZSBvdGhlciAKc2lkZSBpcyBnb25lICh0
aG91Z2ggd2Ugb25seSBjYXJlIGFib3V0IHRoZSBnb25lIG9mIHByb2R1Y2VyIHByb2JhYmx5KS4K
CkFueSB0aG91Z2h0IG9uIHRoaXM/CgpUaGFua3MKCgo+ICsJaWYgKChzdGF0dXMgJiBWSVJUSU9f
Q09ORklHX1NfRFJJVkVSX09LKSAmJiAhKHN0YXR1c19vbGQgJiBWSVJUSU9fQ09ORklHX1NfRFJJ
VkVSX09LKSkKPiArCQlmb3IgKGkgPSAwOyBpIDwgbnZxczsgaSsrKQo+ICsJCQl2aG9zdF92ZHBh
X3NldHVwX3ZxX2lycSh2LCBpKTsKPiArCj4gKwlpZiAoKHN0YXR1c19vbGQgJiBWSVJUSU9fQ09O
RklHX1NfRFJJVkVSX09LKSAmJiAhKHN0YXR1cyAmIFZJUlRJT19DT05GSUdfU19EUklWRVJfT0sp
KQo+ICsJCWZvciAoaSA9IDA7IGkgPCBudnFzOyBpKyspCj4gKwkJCXZob3N0X3ZkcGFfdW5zZXR1
cF92cV9pcnEodiwgaSk7Cj4gKwo+ICAgCW9wcy0+c2V0X3N0YXR1cyh2ZHBhLCBzdGF0dXMpOwo+
ICAgCj4gICAJcmV0dXJuIDA7Cj4gQEAgLTMzMiw2ICszOTQsNyBAQCBzdGF0aWMgbG9uZyB2aG9z
dF92ZHBhX3NldF9jb25maWdfY2FsbChzdHJ1Y3Qgdmhvc3RfdmRwYSAqdiwgdTMyIF9fdXNlciAq
YXJncCkKPiAgIAo+ICAgCXJldHVybiAwOwo+ICAgfQo+ICsKPiAgIHN0YXRpYyBsb25nIHZob3N0
X3ZkcGFfdnJpbmdfaW9jdGwoc3RydWN0IHZob3N0X3ZkcGEgKnYsIHVuc2lnbmVkIGludCBjbWQs
Cj4gICAJCQkJICAgdm9pZCBfX3VzZXIgKmFyZ3ApCj4gICB7Cj4gQEAgLTM5MCw2ICs0NTMsNyBA
QCBzdGF0aWMgbG9uZyB2aG9zdF92ZHBhX3ZyaW5nX2lvY3RsKHN0cnVjdCB2aG9zdF92ZHBhICp2
LCB1bnNpZ25lZCBpbnQgY21kLAo+ICAgCQkJY2IucHJpdmF0ZSA9IE5VTEw7Cj4gICAJCX0KPiAg
IAkJb3BzLT5zZXRfdnFfY2IodmRwYSwgaWR4LCAmY2IpOwo+ICsJCXZob3N0X3ZkcGFfdXBkYXRl
X3ZxX2lycSh2cSk7Cj4gICAJCWJyZWFrOwo+ICAgCj4gICAJY2FzZSBWSE9TVF9TRVRfVlJJTkdf
TlVNOgo+IEBAIC03NjUsNiArODI5LDE4IEBAIHN0YXRpYyBpbnQgdmhvc3RfdmRwYV9vcGVuKHN0
cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxlcCkKPiAgIAlyZXR1cm4gcjsKPiAg
IH0KPiAgIAo+ICtzdGF0aWMgdm9pZCB2aG9zdF92ZHBhX2NsZWFuX2lycShzdHJ1Y3Qgdmhvc3Rf
dmRwYSAqdikKPiArewo+ICsJc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnE7Cj4gKwlpbnQgaTsK
PiArCj4gKwlmb3IgKGkgPSAwOyBpIDwgdi0+bnZxczsgaSsrKSB7Cj4gKwkJdnEgPSAmdi0+dnFz
W2ldOwo+ICsJCWlmICh2cS0+Y2FsbF9jdHgucHJvZHVjZXIuaXJxKQo+ICsJCQlpcnFfYnlwYXNz
X3VucmVnaXN0ZXJfcHJvZHVjZXIoJnZxLT5jYWxsX2N0eC5wcm9kdWNlcik7Cj4gKwl9Cj4gK30K
PiArCj4gICBzdGF0aWMgaW50IHZob3N0X3ZkcGFfcmVsZWFzZShzdHJ1Y3QgaW5vZGUgKmlub2Rl
LCBzdHJ1Y3QgZmlsZSAqZmlsZXApCj4gICB7Cj4gICAJc3RydWN0IHZob3N0X3ZkcGEgKnYgPSBm
aWxlcC0+cHJpdmF0ZV9kYXRhOwo+IEBAIC03NzcsNiArODUzLDcgQEAgc3RhdGljIGludCB2aG9z
dF92ZHBhX3JlbGVhc2Uoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmZpbGVwKQo+
ICAgCXZob3N0X3ZkcGFfaW90bGJfZnJlZSh2KTsKPiAgIAl2aG9zdF92ZHBhX2ZyZWVfZG9tYWlu
KHYpOwo+ICAgCXZob3N0X3ZkcGFfY29uZmlnX3B1dCh2KTsKPiArCXZob3N0X3ZkcGFfY2xlYW5f
aXJxKHYpOwo+ICAgCXZob3N0X2Rldl9jbGVhbnVwKCZ2LT52ZGV2KTsKPiAgIAlrZnJlZSh2LT52
ZGV2LnZxcyk7Cj4gICAJbXV0ZXhfdW5sb2NrKCZkLT5tdXRleCk7CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
