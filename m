Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AE65B26F4E4
	for <lists.virtualization@lfdr.de>; Fri, 18 Sep 2020 06:05:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D7B8187791;
	Fri, 18 Sep 2020 04:05:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VJmwLFI3hCQ1; Fri, 18 Sep 2020 04:05:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5849487790;
	Fri, 18 Sep 2020 04:05:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E58AC0051;
	Fri, 18 Sep 2020 04:05:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13434C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 04:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 07EE3875A9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 04:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xa8SmnaFqO31
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 04:05:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7D9A78759A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 04:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600401911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wlk9HAI4Sd4VAZGEYPJ6IaZsqvXvWVGLIyj7zWCRFbs=;
 b=T0wgRJynluaceOed3HYyjzcytboSmCgX9UvK0Y+F4O3Qr2W7oguRl6QH8zB+h129L9XBGP
 A/soWadzE5ls3ezaoIxwT/teI6PE0De7/Q1gRgMRe1X+mNxq+xNhnaMsfwNBi0Goom7UrL
 g6WXZjG3eO9HKhaltYDQq2Wba+JNMFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-HkFJZdJ0NPyOW6MrbXbx0Q-1; Fri, 18 Sep 2020 00:05:09 -0400
X-MC-Unique: HkFJZdJ0NPyOW6MrbXbx0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD7771891E84;
 Fri, 18 Sep 2020 04:05:06 +0000 (UTC)
Received: from [10.72.13.167] (ovpn-13-167.pek2.redhat.com [10.72.13.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E73E41C4;
 Fri, 18 Sep 2020 04:04:52 +0000 (UTC)
Subject: Re: [RFC PATCH 00/22] Enhance VHOST to enable SoC-to-SoC communication
To: Kishon Vijay Abraham I <kishon@ti.com>, Cornelia Huck <cohuck@redhat.com>
References: <20200702082143.25259-1-kishon@ti.com>
 <20200702055026-mutt-send-email-mst@kernel.org>
 <603970f5-3289-cd53-82a9-aa62b292c552@redhat.com>
 <14c6cad7-9361-7fa4-e1c6-715ccc7e5f6b@ti.com>
 <59fd6a0b-8566-44b7-3dae-bb52b468219b@redhat.com>
 <ce9eb6a5-cd3a-a390-5684-525827b30f64@ti.com>
 <da2b671c-b05d-a57f-7bdf-8b1043a41240@redhat.com>
 <fee8a0fb-f862-03bd-5ede-8f105b6af529@ti.com>
 <b2178e1d-2f5c-e8a3-72fb-70f2f8d6aa45@redhat.com>
 <45a8a97c-2061-13ee-5da8-9877a4a3b8aa@ti.com>
 <c8739d7f-e12e-f6a2-7018-9eeaf6feb054@redhat.com>
 <20200828123409.4cd2a812.cohuck@redhat.com>
 <ac8f7e4f-9f46-919a-f5c2-89b07794f0ab@ti.com>
 <9cd58cd1-0041-3d98-baf7-6e5bc2e7e317@redhat.com>
 <edf25301-93c0-4ba6-aa85-5f04137d0906@ti.com>
 <5733dbfc-76c1-45dc-6dce-ef5449eacc73@redhat.com>
 <181ae83d-edeb-9406-27cc-1195fe29ae95@ti.com>
 <ee0aa81d-064b-d7a7-86bb-79a3f4d3dd11@redhat.com>
 <67924594-c70e-390e-ce2e-dda41a94ada1@ti.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <dc006fed-c3b6-8925-51d8-5ed3ee8662cd@redhat.com>
Date: Fri, 18 Sep 2020 12:04:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <67924594-c70e-390e-ce2e-dda41a94ada1@ti.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Allen Hubbe <allenbh@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, kvm@vger.kernel.org,
 linux-ntb@googlegroups.com, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, netdev@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jon Mason <jdmason@kudzu.us>,
 Bjorn Helgaas <bhelgaas@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvOS8xNiDkuIvljYg3OjQ3LCBLaXNob24gVmlqYXkgQWJyYWhhbSBJIHdyb3RlOgo+
IEhpIEphc29uLAo+Cj4gT24gMTYvMDkvMjAgODo0MCBhbSwgSmFzb24gV2FuZyB3cm90ZToKPj4g
T24gMjAyMC85LzE1IOS4i+WNiDExOjQ3LCBLaXNob24gVmlqYXkgQWJyYWhhbSBJIHdyb3RlOgo+
Pj4gSGkgSmFzb24sCj4+Pgo+Pj4gT24gMTUvMDkvMjAgMTo0OCBwbSwgSmFzb24gV2FuZyB3cm90
ZToKPj4+PiBIaSBLaXNob246Cj4+Pj4KPj4+PiBPbiAyMDIwLzkvMTQg5LiL5Y2IMzoyMywgS2lz
aG9uIFZpamF5IEFicmFoYW0gSSB3cm90ZToKPj4+Pj4+IFRoZW4geW91IG5lZWQgc29tZXRoaW5n
IHRoYXQgaXMgZnVuY3Rpb25hbCBlcXVpdmFsZW50IHRvIHZpcnRpbyBQQ0kKPj4+Pj4+IHdoaWNo
IGlzIGFjdHVhbGx5IHRoZSBjb25jZXB0IG9mIHZEUEEgKGUuZyB2RFBBIHByb3ZpZGVzCj4+Pj4+
PiBhbHRlcm5hdGl2ZXMgaWYKPj4+Pj4+IHRoZSBxdWV1ZV9zZWwgaXMgaGFyZCBpbiB0aGUgRVAg
aW1wbGVtZW50YXRpb24pLgo+Pj4+PiBPa2F5LCBJIGp1c3QgdHJpZWQgdG8gY29tcGFyZSB0aGUg
J3N0cnVjdCB2ZHBhX2NvbmZpZ19vcHMnIGFuZCAnc3RydWN0Cj4+Pj4+IHZob3N0X2NvbmZpZ19v
cHMnICggaW50cm9kdWNlZCBpbiBbUkZDIFBBVENIIDAzLzIyXSB2aG9zdDogQWRkIG9wcyBmb3IK
Pj4+Pj4gdGhlIFZIT1NUIGRyaXZlciB0byBjb25maWd1cmUgVkhPU1QgZGV2aWNlKS4KPj4+Pj4K
Pj4+Pj4gc3RydWN0IHZkcGFfY29uZmlnX29wcyB7Cj4+Pj4+ICDCoMKgwqDCoMKgLyogVmlydHF1
ZXVlIG9wcyAqLwo+Pj4+PiAgwqDCoMKgwqDCoGludCAoKnNldF92cV9hZGRyZXNzKShzdHJ1Y3Qg
dmRwYV9kZXZpY2UgKnZkZXYsCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdTE2IGlkeCwgdTY0IGRlc2NfYXJlYSwgdTY0IGRyaXZlcl9hcmVhLAo+Pj4+PiAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHU2NCBkZXZpY2VfYXJlYSk7Cj4+Pj4+
ICDCoMKgwqDCoMKgdm9pZCAoKnNldF92cV9udW0pKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldiwg
dTE2IGlkeCwgdTMyIG51bSk7Cj4+Pj4+ICDCoMKgwqDCoMKgdm9pZCAoKmtpY2tfdnEpKHN0cnVj
dCB2ZHBhX2RldmljZSAqdmRldiwgdTE2IGlkeCk7Cj4+Pj4+ICDCoMKgwqDCoMKgdm9pZCAoKnNl
dF92cV9jYikoc3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2LCB1MTYgaWR4LAo+Pj4+PiAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgdmRwYV9jYWxsYmFjayAqY2IpOwo+Pj4+PiAg
wqDCoMKgwqDCoHZvaWQgKCpzZXRfdnFfcmVhZHkpKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldiwg
dTE2IGlkeCwgYm9vbAo+Pj4+PiByZWFkeSk7Cj4+Pj4+ICDCoMKgwqDCoMKgYm9vbCAoKmdldF92
cV9yZWFkeSkoc3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2LCB1MTYgaWR4KTsKPj4+Pj4gIMKgwqDC
oMKgwqBpbnQgKCpzZXRfdnFfc3RhdGUpKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldiwgdTE2IGlk
eCwKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCB2
ZHBhX3ZxX3N0YXRlICpzdGF0ZSk7Cj4+Pj4+ICDCoMKgwqDCoMKgaW50ICgqZ2V0X3ZxX3N0YXRl
KShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYsIHUxNiBpZHgsCj4+Pj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgdmRwYV92cV9zdGF0ZSAqc3RhdGUpOwo+Pj4+PiAg
wqDCoMKgwqDCoHN0cnVjdCB2ZHBhX25vdGlmaWNhdGlvbl9hcmVhCj4+Pj4+ICDCoMKgwqDCoMKg
KCpnZXRfdnFfbm90aWZpY2F0aW9uKShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYsIHUxNiBpZHgp
Owo+Pj4+PiAgwqDCoMKgwqDCoC8qIHZxIGlycSBpcyBub3QgZXhwZWN0ZWQgdG8gYmUgY2hhbmdl
ZCBvbmNlIERSSVZFUl9PSyBpcyBzZXQgKi8KPj4+Pj4gIMKgwqDCoMKgwqBpbnQgKCpnZXRfdnFf
aXJxKShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkdiwgdTE2IGlkeCk7Cj4+Pj4+Cj4+Pj4+ICDCoMKg
wqDCoMKgLyogRGV2aWNlIG9wcyAqLwo+Pj4+PiAgwqDCoMKgwqDCoHUzMiAoKmdldF92cV9hbGln
bikoc3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2KTsKPj4+Pj4gIMKgwqDCoMKgwqB1NjQgKCpnZXRf
ZmVhdHVyZXMpKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldik7Cj4+Pj4+ICDCoMKgwqDCoMKgaW50
ICgqc2V0X2ZlYXR1cmVzKShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYsIHU2NCBmZWF0dXJlcyk7
Cj4+Pj4+ICDCoMKgwqDCoMKgdm9pZCAoKnNldF9jb25maWdfY2IpKHN0cnVjdCB2ZHBhX2Rldmlj
ZSAqdmRldiwKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1
Y3QgdmRwYV9jYWxsYmFjayAqY2IpOwo+Pj4+PiAgwqDCoMKgwqDCoHUxNiAoKmdldF92cV9udW1f
bWF4KShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYpOwo+Pj4+PiAgwqDCoMKgwqDCoHUzMiAoKmdl
dF9kZXZpY2VfaWQpKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldik7Cj4+Pj4+ICDCoMKgwqDCoMKg
dTMyICgqZ2V0X3ZlbmRvcl9pZCkoc3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2KTsKPj4+Pj4gIMKg
wqDCoMKgwqB1OCAoKmdldF9zdGF0dXMpKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldik7Cj4+Pj4+
ICDCoMKgwqDCoMKgdm9pZCAoKnNldF9zdGF0dXMpKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldiwg
dTggc3RhdHVzKTsKPj4+Pj4gIMKgwqDCoMKgwqB2b2lkICgqZ2V0X2NvbmZpZykoc3RydWN0IHZk
cGFfZGV2aWNlICp2ZGV2LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAo+Pj4+PiAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHZvaWQgKmJ1ZiwgdW5zaWduZWQgaW50IGxlbik7Cj4+Pj4+ICDC
oMKgwqDCoMKgdm9pZCAoKnNldF9jb25maWcpKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldiwgdW5z
aWduZWQgaW50IG9mZnNldCwKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b25zdCB2b2lkICpidWYsIHVuc2lnbmVkIGludCBsZW4pOwo+Pj4+PiAgwqDCoMKgwqDCoHUzMiAo
KmdldF9nZW5lcmF0aW9uKShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYpOwo+Pj4+Pgo+Pj4+PiAg
wqDCoMKgwqDCoC8qIERNQSBvcHMgKi8KPj4+Pj4gIMKgwqDCoMKgwqBpbnQgKCpzZXRfbWFwKShz
dHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYsIHN0cnVjdCB2aG9zdF9pb3RsYgo+Pj4+PiAqaW90bGIp
Owo+Pj4+PiAgwqDCoMKgwqDCoGludCAoKmRtYV9tYXApKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRl
diwgdTY0IGlvdmEsIHU2NCBzaXplLAo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHU2NCBwYSwgdTMyIHBlcm0pOwo+Pj4+PiAgwqDCoMKgwqDCoGludCAoKmRtYV91bm1hcCko
c3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2LCB1NjQgaW92YSwgdTY0IHNpemUpOwo+Pj4+Pgo+Pj4+
PiAgwqDCoMKgwqDCoC8qIEZyZWUgZGV2aWNlIHJlc291cmNlcyAqLwo+Pj4+PiAgwqDCoMKgwqDC
oHZvaWQgKCpmcmVlKShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYpOwo+Pj4+PiB9Owo+Pj4+Pgo+
Pj4+PiArc3RydWN0IHZob3N0X2NvbmZpZ19vcHMgewo+Pj4+PiArwqDCoMKgIGludCAoKmNyZWF0
ZV92cXMpKHN0cnVjdCB2aG9zdF9kZXYgKnZkZXYsIHVuc2lnbmVkIGludCBudnFzLAo+Pj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IG51bV9idWZzLCBzdHJ1Y3Qg
dmhvc3RfdmlydHF1ZXVlICp2cXNbXSwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHZob3N0X3ZxX2NhbGxiYWNrX3QgKmNhbGxiYWNrc1tdLAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY29uc3QgY2hhciAqIGNvbnN0IG5hbWVzW10pOwo+Pj4+PiArwqDCoMKgIHZv
aWQgKCpkZWxfdnFzKShzdHJ1Y3Qgdmhvc3RfZGV2ICp2ZGV2KTsKPj4+Pj4gK8KgwqDCoCBpbnQg
KCp3cml0ZSkoc3RydWN0IHZob3N0X2RldiAqdmRldiwgdTY0IHZob3N0X2RzdCwgdm9pZCAqc3Jj
LAo+Pj4+PiBpbnQgbGVuKTsKPj4+Pj4gK8KgwqDCoCBpbnQgKCpyZWFkKShzdHJ1Y3Qgdmhvc3Rf
ZGV2ICp2ZGV2LCB2b2lkICpkc3QsIHU2NCB2aG9zdF9zcmMsIGludAo+Pj4+PiBsZW4pOwo+Pj4+
PiArwqDCoMKgIGludCAoKnNldF9mZWF0dXJlcykoc3RydWN0IHZob3N0X2RldiAqdmRldiwgdTY0
IGRldmljZV9mZWF0dXJlcyk7Cj4+Pj4+ICvCoMKgwqAgaW50ICgqc2V0X3N0YXR1cykoc3RydWN0
IHZob3N0X2RldiAqdmRldiwgdTggc3RhdHVzKTsKPj4+Pj4gK8KgwqDCoCB1OCAoKmdldF9zdGF0
dXMpKHN0cnVjdCB2aG9zdF9kZXYgKnZkZXYpOwo+Pj4+PiArfTsKPj4+Pj4gKwo+Pj4+PiBzdHJ1
Y3QgdmlydGlvX2NvbmZpZ19vcHMKPj4+Pj4gSSB0aGluayB0aGVyZSdzIHNvbWUgb3ZlcmxhcCBo
ZXJlIGFuZCBzb21lIG9mIHRoZSBvcHMgdHJpZXMgdG8gZG8gdGhlCj4+Pj4+IHNhbWUgdGhpbmcu
Cj4+Pj4+Cj4+Pj4+IEkgdGhpbmsgaXQgZGlmZmVycyBpbiAoKnNldF92cV9hZGRyZXNzKSgpIGFu
ZCAoKmNyZWF0ZV92cXMpKCkuCj4+Pj4+IFtjcmVhdGVfdnFzKCkgaW50cm9kdWNlZCBpbiBzdHJ1
Y3Qgdmhvc3RfY29uZmlnX29wcyBwcm92aWRlcwo+Pj4+PiBjb21wbGltZW50YXJ5IGZ1bmN0aW9u
YWxpdHkgdG8gKCpmaW5kX3ZxcykoKSBpbiBzdHJ1Y3QKPj4+Pj4gdmlydGlvX2NvbmZpZ19vcHMu
IEl0IHNlZW1pbmdseSBlbmNhcHN1bGF0ZXMgdGhlIGZ1bmN0aW9uYWxpdHkgb2YKPj4+Pj4gKCpz
ZXRfdnFfYWRkcmVzcykoKSwgKCpzZXRfdnFfbnVtKSgpLCAoKnNldF92cV9jYikoKSwuLl0uCj4+
Pj4+Cj4+Pj4+IEJhY2sgdG8gdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiAoKnNldF92cV9hZGRyZXNz
KSgpIGFuZCAoKmNyZWF0ZV92cXMpKCksCj4+Pj4+IHNldF92cV9hZGRyZXNzKCkgZGlyZWN0bHkg
cHJvdmlkZXMgdGhlIHZpcnRxdWV1ZSBhZGRyZXNzIHRvIHRoZSB2ZHBhCj4+Pj4+IGRldmljZSBi
dXQgY3JlYXRlX3ZxcygpIG9ubHkgcHJvdmlkZXMgdGhlIHBhcmFtZXRlcnMgb2YgdGhlIHZpcnRx
dWV1ZQo+Pj4+PiAobGlrZSB0aGUgbnVtYmVyIG9mIHZpcnRxdWV1ZXMsIG51bWJlciBvZiBidWZm
ZXJzKSBidXQgZG9lcyBub3QKPj4+Pj4gZGlyZWN0bHkKPj4+Pj4gcHJvdmlkZSB0aGUgYWRkcmVz
cy4gSU1PIHRoZSBiYWNrZW5kIGNsaWVudCBkcml2ZXJzIChsaWtlIG5ldCBvciB2aG9zdCkKPj4+
Pj4gc2hvdWxkbid0L2Nhbm5vdCBieSBpdHNlbGYga25vdyBob3cgdG8gYWNjZXNzIHRoZSB2cmlu
ZyBjcmVhdGVkIG9uCj4+Pj4+IHZpcnRpbyBmcm9udC1lbmQuIFRoZSB2ZHBhIGRldmljZS92aG9z
dCBkZXZpY2Ugc2hvdWxkIGhhdmUgbG9naWMgZm9yCj4+Pj4+IHRoYXQuIFRoYXQgd2lsbCBoZWxw
IHRoZSBjbGllbnQgZHJpdmVycyB0byB3b3JrIHdpdGggZGlmZmVyZW50IHR5cGVzIG9mCj4+Pj4+
IHZkcGEgZGV2aWNlL3Zob3N0IGRldmljZSBhbmQgY2FuIGFjY2VzcyB0aGUgdnJpbmcgY3JlYXRl
ZCBieSB2aXJ0aW8KPj4+Pj4gaXJyZXNwZWN0aXZlIG9mIHdoZXRoZXIgdGhlIHZyaW5nIGNhbiBi
ZSBhY2Nlc3NlZCB2aWEgbW1pbyBvciBrZXJuZWwKPj4+Pj4gc3BhY2Ugb3IgdXNlciBzcGFjZS4K
Pj4+Pj4KPj4+Pj4gSSB0aGluayB2ZHBhIGFsd2F5cyB3b3JrcyB3aXRoIGNsaWVudCBkcml2ZXJz
IGluIHVzZXJzcGFjZSBhbmQKPj4+Pj4gcHJvdmlkaW5nCj4+Pj4+IHVzZXJzcGFjZSBhZGRyZXNz
IGZvciB2cmluZy4KPj4+PiBTb3JyeSBmb3IgYmVpbmcgdW5jbGVhci4gV2hhdCBJIG1lYW50IGlz
IG5vdCByZXBsYWNpbmcgdkRQQSB3aXRoIHRoZQo+Pj4+IHZob3N0KGJ1cykgeW91IHByb3Bvc2Vk
IGJ1dCB0aGUgcG9zc2liaWxpdHkgb2YgcmVwbGFjaW5nIHZpcnRpby1wY2ktZXBmCj4+Pj4gd2l0
aCB2RFBBIGluOgo+Pj4gT2theSwgc28gdGhlIHZpcnRpbyBiYWNrLWVuZCBzdGlsbCB1c2Ugdmhv
c3QgYW5kIGZyb250IGVuZCBzaG91bGQgdXNlCj4+PiB2RFBBLiBJIHNlZS4gU28gdGhlIGhvc3Qg
c2lkZSBQQ0kgZHJpdmVyIGZvciBFUEYgc2hvdWxkIHBvcHVsYXRlCj4+PiB2ZHBhX2NvbmZpZ19v
cHMgYW5kIGludm9rZSB2ZHBhX3JlZ2lzdGVyX2RldmljZSgpLgo+Pgo+PiBZZXMuCj4+Cj4+Cj4+
Pj4gTXkgcXVlc3Rpb24gaXMgYmFzaWNhbGx5IGZvciB0aGUgcGFydCBvZiB2aXJ0aW9fcGNpX2Vw
Zl9zZW5kX2NvbW1hbmQoKSwKPj4+PiBzbyBpdCBsb29rcyB0byBtZSB5b3UgaGF2ZSBhIHZlbmRv
ciBzcGVjaWZpYyBBUEkgdG8gcmVwbGFjZSB0aGUKPj4+PiB2aXJ0aW8tcGNpIGxheW91dCBvZiB0
aGUgQkFSOgo+Pj4gRXZlbiB3aGVuIHdlIHVzZSB2RFBBLCB3ZSBoYXZlIHRvIHVzZSBzb21lIHNv
cnQgb2YKPj4+IHZpcnRpb19wY2lfZXBmX3NlbmRfY29tbWFuZCgpIHRvIGNvbW11bmljYXRlIHdp
dGggdmlydGlvIGJhY2tlbmQgcmlnaHQ/Cj4+Cj4+IFJpZ2h0Lgo+Pgo+Pgo+Pj4gUmlnaHQsIHRo
ZSBsYXlvdXQgaXMgc2xpZ2h0bHkgZGlmZmVyZW50IGZyb20gdGhlIHN0YW5kYXJkIGxheW91dC4K
Pj4+Cj4+PiBUaGlzIGlzIHRoZSBsYXlvdXQKPj4+IHN0cnVjdCBlcGZfdmhvc3RfcmVnX3F1ZXVl
IHsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgIHU4IGNtZDsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgIHU4
IGNtZF9zdGF0dXM7Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoCB1MTYgc3RhdHVzOwo+Pj4gIMKgwqDC
oMKgwqDCoMKgwqAgdTE2IG51bV9idWZmZXJzOwo+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgdTE2IG1z
aXhfdmVjdG9yOwo+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgdTY0IHF1ZXVlX2FkZHI7Cj4+Cj4+IFdo
YXQncyB0aGUgbWVhbmluZyBvZiBxdWV1ZV9hZGRyIGhlcmU/Cj4gVXNpbmcgcXVldWVfYWRkciwg
dGhlIHZpcnRpbyBmcm9udC1lbmQgY29tbXVuaWNhdGVzIHRoZSBhZGRyZXNzIG9mIHRoZQo+IGFs
bG9jYXRlZCBtZW1vcnkgZm9yIHZpcnRxdWV1ZSB0byB0aGUgdmlydGlvIGJhY2stZW5kLgo+PiBE
b2VzIG5vdCBtZWFuIHRoZSBkZXZpY2UgZXhwZWN0cyBhIGNvbnRpZ3VvdXMgbWVtb3J5IGZvciBh
dmFpbC9kZXNjL3VzZWQKPj4gcmluZz8KPiBJdCdzIGNvbnRpZ3VvdXMgbWVtb3J5LiBJc24ndCB0
aGlzIHNpbWlsYXIgdG8gb3RoZXIgdmlydGlvIHRyYW5zcG9ydAo+IChib3RoIFBDSSBsZWdhY3kg
YW5kIG1vZGVybiBpbnRlcmZhY2UpPy4KCgpUaGF0J3Mgb25seSBmb3IgbGVnYWN5IGRldmljZSwg
Zm9yIG1vZGVybiBkZXZpY2Ugd2UgZG9uJ3QgaGF2ZSBzdWNoIApyZXN0cmljdGlvbi4KCgo+Pgo+
Pj4gfSBfX3BhY2tlZDsKPj4+Cj4+PiBzdHJ1Y3QgZXBmX3Zob3N0X3JlZyB7Cj4+PiAgwqDCoMKg
wqDCoMKgwqDCoCB1NjQgaG9zdF9mZWF0dXJlczsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgIHU2NCBn
dWVzdF9mZWF0dXJlczsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgIHUxNiBtc2l4X2NvbmZpZzsKPj4+
ICDCoMKgwqDCoMKgwqDCoMKgIHUxNiBudW1fcXVldWVzOwo+Pj4gIMKgwqDCoMKgwqDCoMKgwqAg
dTggZGV2aWNlX3N0YXR1czsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgIHU4IGNvbmZpZ19nZW5lcmF0
aW9uOwo+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgdTMyIGlzcjsKPj4+ICDCoMKgwqDCoMKgwqDCoMKg
IHU4IGNtZDsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgIHU4IGNtZF9zdGF0dXM7Cj4+PiAgwqDCoMKg
wqDCoMKgwqDCoCBzdHJ1Y3QgZXBmX3Zob3N0X3JlZ19xdWV1ZSB2cVtNQVhfVlFTXTsKPj4+IH0g
X19wYWNrZWQ7Cj4+Pj4gK3N0YXRpYyBpbnQgdmlydGlvX3BjaV9lcGZfc2VuZF9jb21tYW5kKHN0
cnVjdCB2aXJ0aW9fcGNpX2RldmljZQo+Pj4+ICp2cF9kZXYsCj4+Pj4gK8KgwqDCoCDCoMKgwqAg
wqDCoMKgIMKgwqDCoCDCoMKgwqDCoMKgwqAgdTMyIGNvbW1hbmQpCj4+Pj4gK3sKPj4+PiArwqDC
oMKgIHN0cnVjdCB2aXJ0aW9fcGNpX2VwZiAqcGNpX2VwZjsKPj4+PiArwqDCoMKgIHZvaWQgX19p
b21lbSAqaW9hZGRyOwo+Pj4+ICvCoMKgwqAga3RpbWVfdCB0aW1lb3V0Owo+Pj4+ICvCoMKgwqAg
Ym9vbCB0aW1lZG91dDsKPj4+PiArwqDCoMKgIGludCByZXQgPSAwOwo+Pj4+ICvCoMKgwqAgdTgg
c3RhdHVzOwo+Pj4+ICsKPj4+PiArwqDCoMKgIHBjaV9lcGYgPSB0b192aXJ0aW9fcGNpX2VwZih2
cF9kZXYpOwo+Pj4+ICvCoMKgwqAgaW9hZGRyID0gdnBfZGV2LT5pb2FkZHI7Cj4+Pj4gKwo+Pj4+
ICvCoMKgwqAgbXV0ZXhfbG9jaygmcGNpX2VwZi0+bG9jayk7Cj4+Pj4gK8KgwqDCoCB3cml0ZWIo
Y29tbWFuZCwgaW9hZGRyICsgSE9TVF9DTUQpOwo+Pj4+ICvCoMKgwqAgdGltZW91dCA9IGt0aW1l
X2FkZF9tcyhrdGltZV9nZXQoKSwgQ09NTUFORF9USU1FT1VUKTsKPj4+PiArwqDCoMKgIHdoaWxl
ICgxKSB7Cj4+Pj4gK8KgwqDCoCDCoMKgwqAgdGltZWRvdXQgPSBrdGltZV9hZnRlcihrdGltZV9n
ZXQoKSwgdGltZW91dCk7Cj4+Pj4gK8KgwqDCoCDCoMKgwqAgc3RhdHVzID0gcmVhZGIoaW9hZGRy
ICsgSE9TVF9DTURfU1RBVFVTKTsKPj4+PiArCj4+Pj4KPj4+PiBTZXZlcmFsIHF1ZXN0aW9uczoK
Pj4+Pgo+Pj4+IC0gSXQncyBub3QgY2xlYXIgdG8gbWUgaG93IHRoZSBzeW5jaHJvbml6YXRpb24g
aXMgZG9uZSBiZXR3ZWVuIHRoZSBSQwo+Pj4+IGFuZCBFUC4gRS5nIGhvdyBhbmQgd2hlbiB0aGUg
dmFsdWUgb2YgSE9TVF9DTURfU1RBVFVTIGNhbiBiZSBjaGFuZ2VkLgo+Pj4gVGhlIEhPU1RfQ01E
IChjb21tYW5kcyBzZW50IHRvIHRoZSBFUCkgaXMgc2VyaWFsaXplZCBieSB1c2luZyBtdXRleC4K
Pj4+IE9uY2UgdGhlIEVQIHJlYWRzIHRoZSBjb21tYW5kLCBpdCByZXNldHMgdGhlIHZhbHVlIGlu
IEhPU1RfQ01ELiBTbwo+Pj4gSE9TVF9DTUQgaXMgbGVzcyBsaWtlbHkgYW4gaXNzdWUuCj4+Cj4+
IEhlcmUncyBteSB1bmRlcnN0YW5kaW5nIG9mIHRoZSBwcm90b2NvbDoKPj4KPj4gMSkgUkMgd3Jp
dGUgdG8gSE9TVF9DTUQKPj4gMikgUkMgd2FpdCBmb3IgSE9TVF9DTURfU1RBVFVTIHRvIGJlIEhP
U1RfQ01EX1NUQVRVU19PS0FZCj4gVGhhdCdzIHJpZ2h0IQo+PiBJdCBsb29rcyB0byBtZSB3aGF0
IEVQIHNob3VsZCBkbyBpcwo+Pgo+PiAxKSBFUCByZXNldCBIT1NUX0NNRCBhZnRlciByZWFkaW5n
IG5ldyBjb21tYW5kCj4gVGhhdCdzIHJpZ2h0ISBJdCBkb2VzLgo+PiBBbmQgaXQgbG9va3MgdG8g
bWUgRVAgc2hvdWxkIGFsc28gcmVzZXQgSE9TVF9DTURfU1RBVFVTIGhlcmU/Cj4geWVhaCwgdGhh
dCB3b3VsZCByZXF1aXJlIFJDIHRvIHNlbmQgYW5vdGhlciBjb21tYW5kIHRvIHJlc2V0IHRoZSBz
dGF0dXMuCj4gRGlkbid0IHNlZSBpdCByZXF1aXJlZCBpbiB0aGUgbm9ybWFsIHNjZW5hcmlvIGJ1
dCBnb29kIHRvIGFkZCB0aGlzLgo+PiAoSSB0aG91Z2h0IHRoZXJlIHNob3VsZCBiZSBwYXRjaCB0
byBoYW5kbGUgc3R1ZmZzIGxpa2UgdGhpcyBidXQgSSBkaWRuJ3QKPj4gZmluZCBpdCBpbiB0aGlz
IHNlcmllcykKPiBUaGlzIGlzIGFkZGVkIGluIFtSRkMgUEFUQ0ggMTkvMjJdIFBDSTogZW5kcG9p
bnQ6IEFkZCBFUCBmdW5jdGlvbiBkcml2ZXIKPiB0byBwcm92aWRlIFZIT1NUIGludGVyZmFjZQo+
Cj4gcGNpX2VwZl92aG9zdF9jbWRfaGFuZGxlcigpIGdldHMgY29tbWFuZHMgZnJvbSBSQyB1c2lu
ZyAicmVnLT5jbWQ7Ii4gT24KPiB0aGUgRVAgc2lkZSwgaXQgaXMgbG9jYWwgbWVtb3J5IGFjY2Vz
cyAobWFwcGVkIHRvIEJBUiBtZW1vcnkgZXhwb3NlZCB0bwo+IHRoZSBob3N0KSBhbmQgaGVuY2Ug
YWNjZXNzZWQgdXNpbmcgc3RydWN0dXJlIG1lbWJlciBhY2Nlc3MuCgoKVGhhbmtzIGZvciB0aGUg
cG9pbnRlciwgd2lsbCBoYXZlIGEgbG9vayBhdCBhbmQgSSB0aGluayB0aGlzIHBhcnQgbmVlZCAK
dG8gYmUgY2FyZWZ1bGx5IGRlc2lnbmVkIGFuZCB0aGUga2V5IHRvIHRoZSBzdWNjZXNzIG9mIHRo
ZSBlcGYgdHJhbnNwb3J0LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
