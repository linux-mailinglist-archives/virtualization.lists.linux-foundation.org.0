Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B136123F47
	for <lists.virtualization@lfdr.de>; Wed, 18 Dec 2019 06:53:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DBFF38838C;
	Wed, 18 Dec 2019 05:53:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fc2p+Gnz08a4; Wed, 18 Dec 2019 05:53:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6987488386;
	Wed, 18 Dec 2019 05:53:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 508EBC077D;
	Wed, 18 Dec 2019 05:53:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 501CAC077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 05:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 44F11878A1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 05:53:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OPpUYy1Q7uZ5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 05:53:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6E34187895
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 05:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576648416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GWocaOhvv7iz+Y/q3X9mGWyFBvKPi09TUVpc/LIJHfQ=;
 b=dpmgfpz2bBlccPiIug7w7vgwLudqfoLEgqUyFwdFeKO0iVXv+iihrr4GDlYr7sePhXawHa
 xSgHp+YXIJlR7HNt70jy9crSPNhHWM2CTaEHbAiI+QlOIXSk+lvJ2jAp9dNx1taTQr2w+I
 FMHxq1+m0KwoQFdrsr9YeDMSqQ0UF94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-c8U9DMXXOUOp4b8hEnHBtg-1; Wed, 18 Dec 2019 00:53:32 -0500
X-MC-Unique: c8U9DMXXOUOp4b8hEnHBtg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D09510054E3;
 Wed, 18 Dec 2019 05:53:31 +0000 (UTC)
Received: from [10.72.12.155] (ovpn-12-155.pek2.redhat.com [10.72.12.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26C1C1001902;
 Wed, 18 Dec 2019 05:53:20 +0000 (UTC)
Subject: Re: [PATCH 1/1] drivers/vhost : Removes unnecessary 'else' in
 vhost_copy_from_user
To: Leonardo Bras <leonardo@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20191212211539.34578-1-leonardo@linux.ibm.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <86408a73-1acf-562b-75c0-08ca2728ed36@redhat.com>
Date: Wed, 18 Dec 2019 13:53:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191212211539.34578-1-leonardo@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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

Ck9uIDIwMTkvMTIvMTMg5LiK5Y2INToxNSwgTGVvbmFyZG8gQnJhcyB3cm90ZToKPiBUaGVyZSBp
cyBubyBuZWVkIGZvciB0aGlzIGVsc2Ugc3RhdGVtZW50LCBnaXZlbiB0aGF0IGlmIGJsb2NrIHdp
bGwgcmV0dXJuLgo+IFRoaXMgY2hhbmdlIGlzIG5vdCBzdXBwb3NlZCB0byBjaGFuZ2UgdGhlIG91
dHB1dCBiaW5hcnkuCj4KPiBJdCByZWR1Y2VzIGlkZW50YXRpb24gbGV2ZWwgb24gbW9zdCBsaW5l
cyBpbiB0aGlzIGZ1bmN0aW9uLCBhbmQgYWxzbwo+IGZpeGVzIGFuIHNwbGl0IHN0cmluZyBvbiB2
cV9lcnIoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IExlb25hcmRvIEJyYXMgPGxlb25hcmRvQGxpbnV4
LmlibS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCA1MCArKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMjQg
aW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92
aG9zdC92aG9zdC5jIGIvZHJpdmVycy92aG9zdC92aG9zdC5jCj4gaW5kZXggZjQ0MzQwYjQxNDk0
Li5iMjNkMWI3NGMzMmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aG9zdC92aG9zdC5jCj4gKysr
IGIvZHJpdmVycy92aG9zdC92aG9zdC5jCj4gQEAgLTgyNCwzNCArODI0LDMyIEBAIHN0YXRpYyBp
bnQgdmhvc3RfY29weV9mcm9tX3VzZXIoc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEsIHZvaWQg
KnRvLAo+ICAgCj4gICAJaWYgKCF2cS0+aW90bGIpCj4gICAJCXJldHVybiBfX2NvcHlfZnJvbV91
c2VyKHRvLCBmcm9tLCBzaXplKTsKPiAtCWVsc2Ugewo+IC0JCS8qIFRoaXMgZnVuY3Rpb24gc2hv
dWxkIGJlIGNhbGxlZCBhZnRlciBpb3RsYgo+IC0JCSAqIHByZWZldGNoLCB3aGljaCBtZWFucyB3
ZSdyZSBzdXJlIHRoYXQgdnEKPiAtCQkgKiBjb3VsZCBiZSBhY2Nlc3MgdGhyb3VnaCBpb3RsYi4g
U28gLUVBR0FJTiBzaG91bGQKPiAtCQkgKiBub3QgaGFwcGVuIGluIHRoaXMgY2FzZS4KPiAtCQkg
Ki8KPiAtCQl2b2lkIF9fdXNlciAqdWFkZHIgPSB2aG9zdF92cV9tZXRhX2ZldGNoKHZxLAo+IC0J
CQkJICAgICAodTY0KSh1aW50cHRyX3QpZnJvbSwgc2l6ZSwKPiAtCQkJCSAgICAgVkhPU1RfQURE
Ul9ERVNDKTsKPiAtCQlzdHJ1Y3QgaW92X2l0ZXIgZjsKPiAgIAo+IC0JCWlmICh1YWRkcikKPiAt
CQkJcmV0dXJuIF9fY29weV9mcm9tX3VzZXIodG8sIHVhZGRyLCBzaXplKTsKPiArCS8qIFRoaXMg
ZnVuY3Rpb24gc2hvdWxkIGJlIGNhbGxlZCBhZnRlciBpb3RsYgo+ICsJICogcHJlZmV0Y2gsIHdo
aWNoIG1lYW5zIHdlJ3JlIHN1cmUgdGhhdCB2cQo+ICsJICogY291bGQgYmUgYWNjZXNzIHRocm91
Z2ggaW90bGIuIFNvIC1FQUdBSU4gc2hvdWxkCj4gKwkgKiBub3QgaGFwcGVuIGluIHRoaXMgY2Fz
ZS4KPiArCSAqLwo+ICsJdm9pZCBfX3VzZXIgKnVhZGRyID0gdmhvc3RfdnFfbWV0YV9mZXRjaCh2
cSwKPiArCQkJICAgICAodTY0KSh1aW50cHRyX3QpZnJvbSwgc2l6ZSwKPiArCQkJICAgICBWSE9T
VF9BRERSX0RFU0MpOwo+ICsJc3RydWN0IGlvdl9pdGVyIGY7CgoKSSB0aGluayB0aGlzIHdpbGwg
bGVhZCBhdCBsZWFzdCB3YXJuaW5ncyBmcm9tIGNvbXBpbGVyLgoKR2VuZXJhbGx5LCBJIHdvdWxk
IG5vdCBib3RoZXIgdG8gbWFrZSBjaGFuZ2VzIGxpa2UgdGhpcyBlc3BlY2lhbGx5IApjb25zaWRl
ciBpdCB3aWxsIGJyaW5nIHRyb3VibGVzIHdoZW4gdHJ5aW5nIHRvIGJhY2twb3J0aW5nIGZpeGVz
IHRvIApkb3duc3RyZWFtIGluIHRoZSBmdXR1cmUuCgpUaGVyZSdyZSBzb21lIG1vcmUgaW50ZXJl
c3RpbmcgdGhpbmdzOiBlLmcgY3VycmVudCBtZXRhZGF0YSBJT1RMQiAKcGVyZm9ybWFuY2UgaXMg
YmFkIGZvciBkeW5hbWljIG1hcHBpbmcgc2luY2UgaXQgd2lsbCBiZSByZXNldCBlYWNoIHRpbWUg
CmEgbmV3IHVwZGF0aW5nIGlzIGNvbWluZy4KCldlIGNhbiBvcHRpbWl6ZSB0aGlzIGJ5IG9ubHkg
cmVzZXQgdGhlIG1ldGFkYXRhIElPVExCIHdoZW4gdGhlIHVwZGF0aW5nIAppcyBmb3IgbWV0ZGF0
YS4KCldhbnQgdG8gdHJ5IHRoaXM/CgpUaGFua3MKCgo+ICAgCj4gLQkJcmV0ID0gdHJhbnNsYXRl
X2Rlc2ModnEsICh1NjQpKHVpbnRwdHJfdClmcm9tLCBzaXplLCB2cS0+aW90bGJfaW92LAo+IC0J
CQkJICAgICBBUlJBWV9TSVpFKHZxLT5pb3RsYl9pb3YpLAo+IC0JCQkJICAgICBWSE9TVF9BQ0NF
U1NfUk8pOwo+IC0JCWlmIChyZXQgPCAwKSB7Cj4gLQkJCXZxX2Vycih2cSwgIklPVExCIHRyYW5z
bGF0aW9uIGZhaWx1cmU6IHVhZGRyICIKPiAtCQkJICAgICAgICIlcCBzaXplIDB4JWxseFxuIiwg
ZnJvbSwKPiAtCQkJICAgICAgICh1bnNpZ25lZCBsb25nIGxvbmcpIHNpemUpOwo+IC0JCQlnb3Rv
IG91dDsKPiAtCQl9Cj4gLQkJaW92X2l0ZXJfaW5pdCgmZiwgUkVBRCwgdnEtPmlvdGxiX2lvdiwg
cmV0LCBzaXplKTsKPiAtCQlyZXQgPSBjb3B5X2Zyb21faXRlcih0bywgc2l6ZSwgJmYpOwo+IC0J
CWlmIChyZXQgPT0gc2l6ZSkKPiAtCQkJcmV0ID0gMDsKPiAtCX0KPiArCWlmICh1YWRkcikKPiAr
CQlyZXR1cm4gX19jb3B5X2Zyb21fdXNlcih0bywgdWFkZHIsIHNpemUpOwo+ICsKPiArCXJldCA9
IHRyYW5zbGF0ZV9kZXNjKHZxLCAodTY0KSh1aW50cHRyX3QpZnJvbSwgc2l6ZSwgdnEtPmlvdGxi
X2lvdiwKPiArCQkJICAgICBBUlJBWV9TSVpFKHZxLT5pb3RsYl9pb3YpLAo+ICsJCQkgICAgIFZI
T1NUX0FDQ0VTU19STyk7Cj4gKwlpZiAocmV0IDwgMCkgewo+ICsJCXZxX2Vycih2cSwgIklPVExC
IHRyYW5zbGF0aW9uIGZhaWx1cmU6IHVhZGRyICVwIHNpemUgMHglbGx4XG4iLAo+ICsJCSAgICAg
ICBmcm9tLCAodW5zaWduZWQgbG9uZyBsb25nKXNpemUpOwo+ICsJCWdvdG8gb3V0Owo+ICsJfQo+
ICsJaW92X2l0ZXJfaW5pdCgmZiwgUkVBRCwgdnEtPmlvdGxiX2lvdiwgcmV0LCBzaXplKTsKPiAr
CXJldCA9IGNvcHlfZnJvbV9pdGVyKHRvLCBzaXplLCAmZik7Cj4gKwlpZiAocmV0ID09IHNpemUp
Cj4gKwkJcmV0ID0gMDsKPiAgIAo+ICAgb3V0Ogo+ICAgCXJldHVybiByZXQ7CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWls
aW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRp
b24=
