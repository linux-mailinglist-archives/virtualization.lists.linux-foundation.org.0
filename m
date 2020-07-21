Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A97227832
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 07:34:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E078B8888D;
	Tue, 21 Jul 2020 05:34:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R5a-qwKUl5Df; Tue, 21 Jul 2020 05:34:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3986888889;
	Tue, 21 Jul 2020 05:34:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 222C0C016F;
	Tue, 21 Jul 2020 05:34:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F607C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 05:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3398C87D36
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 05:34:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lTjPWkoEPvtY
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 05:34:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EDAA987D2D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 05:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595309689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A9DeyT/Te+u96c5OpliRfzztbAI2QqHnWn+vnnjCPUw=;
 b=XchnpPL/a3kVlRvS+4j8ANenr3y9jpTTXT/VHJu4cpqnE2jC7VdgBdGobkQtj2DP1xggoF
 TA8bMS6yj5do1wdQUTzvWhw+AThzLKwsnnd2LeCfRRntMTpD+jnMDbxrpm4OoTKKhBGjv8
 24F1CsGVY/mlthDZE2/hnrqpvIEMoFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-V-w9XEj9OJyWlwaYnSuNOg-1; Tue, 21 Jul 2020 01:34:45 -0400
X-MC-Unique: V-w9XEj9OJyWlwaYnSuNOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6A208017FB;
 Tue, 21 Jul 2020 05:34:43 +0000 (UTC)
Received: from [10.72.12.202] (ovpn-12-202.pek2.redhat.com [10.72.12.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE86E5D9CA;
 Tue, 21 Jul 2020 05:34:35 +0000 (UTC)
Subject: Re: [PATCH V2 vhost next 06/10] vdpa: Modify get_vq_state() to return
 error code
To: Eli Cohen <eli@mellanox.com>, mst@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20200720071416.32112-1-eli@mellanox.com>
 <20200720071416.32112-7-eli@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2e4a764e-391a-6b4e-26e0-1ccdd5d5e7a3@redhat.com>
Date: Tue, 21 Jul 2020 13:34:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720071416.32112-7-eli@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: shahafs@mellanox.com, parav@mellanox.com, saeedm@mellanox.com
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

Ck9uIDIwMjAvNy8yMCDkuIvljYgzOjE0LCBFbGkgQ29oZW4gd3JvdGU6Cj4gTW9kaWZ5IGdldF92
cV9zdGF0ZSgpIHNvIGl0IHJldHVybnMgYW4gZXJyb3IgY29kZS4gSW4gY2FzZSBvZiBoYXJkd2Fy
ZQo+IGFjY2VsZXJhdGlvbiwgdGhlIGF2YWlsYWJsZSBpbmRleCBtYXkgYmUgcmV0cmlldmVkIGZy
b20gdGhlIGRldmljZSwgYW4KPiBvcGVyYXRpb24gdGhhdCBjYW4gcG9zc2libHkgZmFpbC4KPgo+
IFJldmlld2VkLWJ5OiBQYXJhdiBQYW5kaXQgPHBhcmF2QG1lbGxhbm94LmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBFbGkgQ29oZW4gPGVsaUBtZWxsYW5veC5jb20+CgoKQWNrZWQtYnk6IEphc29uIFdh
bmcgPGphc293YW5nQHJlZGhhdC5jb20+CgoKPiAtLS0KPiAgIGRyaXZlcnMvdmRwYS9pZmN2Zi9p
ZmN2Zl9tYWluLmMgIHwgNSArKystLQo+ICAgZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2lt
LmMgfCA1ICsrKy0tCj4gICBkcml2ZXJzL3Zob3N0L3ZkcGEuYyAgICAgICAgICAgICB8IDUgKysr
Ky0KPiAgIGluY2x1ZGUvbGludXgvdmRwYS5oICAgICAgICAgICAgIHwgNCArKy0tCj4gICA0IGZp
bGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYyBiL2RyaXZlcnMvdmRwYS9pZmN2
Zi9pZmN2Zl9tYWluLmMKPiBpbmRleCA2OTAzMmVlOTc4MjQuLmQ5YjVmNDY1YWM4MSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jCj4gKysrIGIvZHJpdmVycy92
ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYwo+IEBAIC0yMzUsMTIgKzIzNSwxMyBAQCBzdGF0aWMgdTE2
IGlmY3ZmX3ZkcGFfZ2V0X3ZxX251bV9tYXgoc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhX2RldikK
PiAgIAlyZXR1cm4gSUZDVkZfUVVFVUVfTUFYOwo+ICAgfQo+ICAgCj4gLXN0YXRpYyB2b2lkIGlm
Y3ZmX3ZkcGFfZ2V0X3ZxX3N0YXRlKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYV9kZXYsIHUxNiBx
aWQsCj4gLQkJCQkgICAgc3RydWN0IHZkcGFfdnFfc3RhdGUgKnN0YXRlKQo+ICtzdGF0aWMgaW50
IGlmY3ZmX3ZkcGFfZ2V0X3ZxX3N0YXRlKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYV9kZXYsIHUx
NiBxaWQsCj4gKwkJCQkgICBzdHJ1Y3QgdmRwYV92cV9zdGF0ZSAqc3RhdGUpCj4gICB7Cj4gICAJ
c3RydWN0IGlmY3ZmX2h3ICp2ZiA9IHZkcGFfdG9fdmYodmRwYV9kZXYpOwo+ICAgCj4gICAJc3Rh
dGUtPmF2YWlsX2luZGV4ID0gaWZjdmZfZ2V0X3ZxX3N0YXRlKHZmLCBxaWQpOwo+ICsJcmV0dXJu
IDA7Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyBpbnQgaWZjdmZfdmRwYV9zZXRfdnFfc3RhdGUoc3Ry
dWN0IHZkcGFfZGV2aWNlICp2ZHBhX2RldiwgdTE2IHFpZCwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMgYi9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9z
aW0uYwo+IGluZGV4IDU5OTUxOTAzOWY4ZC4uZGRmNjA4NmQ0M2MyIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5jCj4gKysrIGIvZHJpdmVycy92ZHBhL3ZkcGFf
c2ltL3ZkcGFfc2ltLmMKPiBAQCAtNDI3LDE0ICs0MjcsMTUgQEAgc3RhdGljIGludCB2ZHBhc2lt
X3NldF92cV9zdGF0ZShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEsIHUxNiBpZHgsCj4gICAJcmV0
dXJuIDA7Cj4gICB9Cj4gICAKPiAtc3RhdGljIHZvaWQgdmRwYXNpbV9nZXRfdnFfc3RhdGUoc3Ry
dWN0IHZkcGFfZGV2aWNlICp2ZHBhLCB1MTYgaWR4LAo+IC0JCQkJIHN0cnVjdCB2ZHBhX3ZxX3N0
YXRlICpzdGF0ZSkKPiArc3RhdGljIGludCB2ZHBhc2ltX2dldF92cV9zdGF0ZShzdHJ1Y3QgdmRw
YV9kZXZpY2UgKnZkcGEsIHUxNiBpZHgsCj4gKwkJCQlzdHJ1Y3QgdmRwYV92cV9zdGF0ZSAqc3Rh
dGUpCj4gICB7Cj4gICAJc3RydWN0IHZkcGFzaW0gKnZkcGFzaW0gPSB2ZHBhX3RvX3NpbSh2ZHBh
KTsKPiAgIAlzdHJ1Y3QgdmRwYXNpbV92aXJ0cXVldWUgKnZxID0gJnZkcGFzaW0tPnZxc1tpZHhd
Owo+ICAgCXN0cnVjdCB2cmluZ2ggKnZyaCA9ICZ2cS0+dnJpbmc7Cj4gICAKPiAgIAlzdGF0ZS0+
YXZhaWxfaW5kZXggPSB2cmgtPmxhc3RfYXZhaWxfaWR4Owo+ICsJcmV0dXJuIDA7Cj4gICB9Cj4g
ICAKPiAgIHN0YXRpYyB1MzIgdmRwYXNpbV9nZXRfdnFfYWxpZ24oc3RydWN0IHZkcGFfZGV2aWNl
ICp2ZHBhKQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3ZkcGEuYyBiL2RyaXZlcnMvdmhv
c3QvdmRwYS5jCj4gaW5kZXggYWY5OGMxMWM5ZDI2Li5mYWRhZDc0Zjg4MmUgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy92aG9zdC92ZHBhLmMKPiArKysgYi9kcml2ZXJzL3Zob3N0L3ZkcGEuYwo+IEBA
IC0zNjAsNyArMzYwLDEwIEBAIHN0YXRpYyBsb25nIHZob3N0X3ZkcGFfdnJpbmdfaW9jdGwoc3Ry
dWN0IHZob3N0X3ZkcGEgKnYsIHVuc2lnbmVkIGludCBjbWQsCj4gICAJfQo+ICAgCj4gICAJaWYg
KGNtZCA9PSBWSE9TVF9HRVRfVlJJTkdfQkFTRSkgewo+IC0JCW9wcy0+Z2V0X3ZxX3N0YXRlKHYt
PnZkcGEsIGlkeCwgJnZxX3N0YXRlKTsKPiArCQlyID0gb3BzLT5nZXRfdnFfc3RhdGUodi0+dmRw
YSwgaWR4LCAmdnFfc3RhdGUpOwo+ICsJCWlmIChyKQo+ICsJCQlyZXR1cm4gcjsKPiArCj4gICAJ
CXZxLT5sYXN0X2F2YWlsX2lkeCA9IHZxX3N0YXRlLmF2YWlsX2luZGV4Owo+ICAgCX0KPiAgIAo+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3ZkcGEuaCBiL2luY2x1ZGUvbGludXgvdmRwYS5o
Cj4gaW5kZXggN2IwODhiZWJmZmU4Li4wMDBkNzFhOWY5ODggMTAwNjQ0Cj4gLS0tIGEvaW5jbHVk
ZS9saW51eC92ZHBhLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3ZkcGEuaAo+IEBAIC0xODUsOCAr
MTg1LDggQEAgc3RydWN0IHZkcGFfY29uZmlnX29wcyB7Cj4gICAJYm9vbCAoKmdldF92cV9yZWFk
eSkoc3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2LCB1MTYgaWR4KTsKPiAgIAlpbnQgKCpzZXRfdnFf
c3RhdGUpKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldiwgdTE2IGlkeCwKPiAgIAkJCSAgICBjb25z
dCBzdHJ1Y3QgdmRwYV92cV9zdGF0ZSAqc3RhdGUpOwo+IC0Jdm9pZCAoKmdldF92cV9zdGF0ZSko
c3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2LCB1MTYgaWR4LAo+IC0JCQkgICAgIHN0cnVjdCB2ZHBh
X3ZxX3N0YXRlICpzdGF0ZSk7Cj4gKwlpbnQgKCpnZXRfdnFfc3RhdGUpKHN0cnVjdCB2ZHBhX2Rl
dmljZSAqdmRldiwgdTE2IGlkeCwKPiArCQkJICAgIHN0cnVjdCB2ZHBhX3ZxX3N0YXRlICpzdGF0
ZSk7Cj4gICAJc3RydWN0IHZkcGFfbm90aWZpY2F0aW9uX2FyZWEKPiAgIAkoKmdldF92cV9ub3Rp
ZmljYXRpb24pKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldiwgdTE2IGlkeCk7Cj4gICAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
