Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D31E32B3BF3
	for <lists.virtualization@lfdr.de>; Mon, 16 Nov 2020 05:00:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C03BF8717F;
	Mon, 16 Nov 2020 04:00:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pYlaYlFdjd3i; Mon, 16 Nov 2020 04:00:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EAEFC8717C;
	Mon, 16 Nov 2020 04:00:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA9A6C1834;
	Mon, 16 Nov 2020 04:00:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DDA4C07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 04:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 422BA8560C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 04:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uBOLbUeQo51i
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 04:00:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1BB2D85184
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 04:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605499225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sFnKFJW6rPMa4deVGsmQaH5RHx/GZ5LC8cjCsTASoq8=;
 b=L7+yIFowHdVPMbvr2KlS33FJrGdpbkOv9+U4KMbE4b+ppBB+x6slWQTXSzzcCQYkhBKcoO
 xxe4eAYbMzMoALJ/GAAdkb5+C92hQeQqjIokbX0OobXFIM4MOCHxXg5U43LS9i4CmqyZj2
 ppnNeCywSgMCFg4115mM2bSW7ImUOmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-FIXOWkvbNXSXu0YK2nMAMA-1; Sun, 15 Nov 2020 23:00:23 -0500
X-MC-Unique: FIXOWkvbNXSXu0YK2nMAMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2607106B387;
 Mon, 16 Nov 2020 04:00:21 +0000 (UTC)
Received: from [10.72.13.126] (ovpn-13-126.pek2.redhat.com [10.72.13.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3EC619D6C;
 Mon, 16 Nov 2020 04:00:12 +0000 (UTC)
Subject: Re: [PATCH RFC 02/12] vdpa: split vdpasim to core and net modules
To: Stefano Garzarella <sgarzare@redhat.com>,
 virtualization@lists.linux-foundation.org
References: <20201113134712.69744-1-sgarzare@redhat.com>
 <20201113134712.69744-3-sgarzare@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d2224629-6ca1-ed06-e2e9-f6008a3af727@redhat.com>
Date: Mon, 16 Nov 2020 12:00:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201113134712.69744-3-sgarzare@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <elic@nvidia.com>
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

Ck9uIDIwMjAvMTEvMTMg5LiL5Y2IOTo0NywgU3RlZmFubyBHYXJ6YXJlbGxhIHdyb3RlOgo+IEZy
b206IE1heCBHdXJ0b3ZveSA8bWd1cnRvdm95QG52aWRpYS5jb20+Cj4KPiBJbnRyb2R1Y2UgbmV3
IHZkcGFfc2ltX25ldCBhbmQgdmRwYV9zaW0gKGNvcmUpIGRyaXZlcnMuIFRoaXMgaXMgYQo+IHBy
ZXBhcmF0aW9uIGZvciBhZGRpbmcgYSB2ZHBhIHNpbXVsYXRvciBtb2R1bGUgZm9yIGJsb2NrIGRl
dmljZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXggR3VydG92b3kgPG1ndXJ0b3ZveUBudmlkaWEu
Y29tPgo+IFtzZ2FyemFyZTogdmFyaW91cyBjbGVhbnVwcy9maXhlc10KPiBTaWduZWQtb2ZmLWJ5
OiBTdGVmYW5vIEdhcnphcmVsbGEgPHNnYXJ6YXJlQHJlZGhhdC5jb20+Cj4gLS0tCj4gdjE6Cj4g
LSBSZW1vdmVkIHVudXNlZCBoZWFkZXJzCj4gLSBSZW1vdmVkIGVtcHR5IG1vZHVsZV9pbml0KCkg
bW9kdWxlX2V4aXQoKQo+IC0gTW92ZWQgdmRwYXNpbV9pc19saXR0bGVfZW5kaWFuKCkgaW4gdmRw
YV9zaW0uaAo+IC0gTW92ZWQgdmRwYXNpbTE2X3RvX2NwdS9jcHVfdG9fdmRwYXNpbTE2KCkgaW4g
dmRwYV9zaW0uaAo+IC0gQWRkZWQgdmRwYXNpbSpfdG9fY3B1L2NwdV90b192ZHBhc2ltKigpIGFs
c28gZm9yIDMyIGFuZCA2NAo+IC0gUmVwbGFjZWQgJ3NlbGVjdCBWRFBBX1NJTScgd2l0aCAnZGVw
ZW5kcyBvbiBWRFBBX1NJTScgc2luY2Ugc2VsZWN0ZWQKPiAgICBvcHRpb24gY2FuIG5vdCBkZXBl
bmQgb24gb3RoZXIgW0phc29uXQoKCklmIHBvc3NpYmxlLCBJIHdvdWxkIHN1Z2dlc3QgdG8gc3Bs
aXQgdGhpcyBwYXRjaCBmdXJ0aGVyOgoKMSkgY29udmVydCB0byB1c2Ugdm9pZCAqY29uZmlnLCBh
bmQgYW4gYXR0cmlidXRlIGZvciBzZXR0aW5nIGNvbmZpZyBzaXplIApkdXJpbmcgYWxsb2NhdGlv
bgoyKSBpbnRyb2R1Y2Ugc3VwcG9ydGVkX2ZlYXR1cmVzCjMpIG90aGVyIGF0dHJpYnV0ZXMgKCN2
cXMpCjQpIHJlbmFtZSBjb25maWcgb3BzIChtb3JlIGdlbmVyaWMgb25lKQo1KSBpbnRyb2R1Y2Ug
b3BzIGZvciBzZXR8Z2V0X2NvbmZpZywgc2V0X2dldF9mZWF0dXJlcwo2KSByZWFsIHNwbGl0CgoK
PiAtLS0KPiAgIGRyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5oICAgICB8IDExMCArKysr
KysrKysrKwo+ICAgZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMgICAgIHwgMjg1ICsr
KysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFf
c2ltX25ldC5jIHwgMTUzICsrKysrKysrKysrKysrCj4gICBkcml2ZXJzL3ZkcGEvS2NvbmZpZyAg
ICAgICAgICAgICAgICAgfCAgIDcgKy0KPiAgIGRyaXZlcnMvdmRwYS92ZHBhX3NpbS9NYWtlZmls
ZSAgICAgICB8ICAgMSArCj4gICA1IGZpbGVzIGNoYW5nZWQsIDMyOSBpbnNlcnRpb25zKCspLCAy
MjcgZGVsZXRpb25zKC0pCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92ZHBhL3ZkcGFf
c2ltL3ZkcGFfc2ltLmgKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZkcGEvdmRwYV9z
aW0vdmRwYV9zaW1fbmV0LmMKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0v
dmRwYV9zaW0uaCBiL2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5oCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjMzNjEzYzQ5ODg4Ywo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uaAo+IEBAIC0wLDAg
KzEsMTEwIEBACj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4gKy8q
Cj4gKyAqIENvcHlyaWdodCAoYykgMjAyMCwgUmVkIEhhdCBJbmMuIEFsbCByaWdodHMgcmVzZXJ2
ZWQuCj4gKyAqLwo+ICsKPiArI2lmbmRlZiBfVkRQQV9TSU1fSAo+ICsjZGVmaW5lIF9WRFBBX1NJ
TV9ICj4gKwo+ICsjaW5jbHVkZSA8bGludXgvdnJpbmdoLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC92
ZHBhLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC92aG9zdF9pb3RsYi5oPgo+ICsjaW5jbHVkZSA8dWFw
aS9saW51eC92aXJ0aW9fY29uZmlnLmg+Cj4gKyNpbmNsdWRlIDx1YXBpL2xpbnV4L3ZpcnRpb19u
ZXQuaD4KPiArI2luY2x1ZGUgPHVhcGkvbGludXgvdmlydGlvX2Jsay5oPgo+ICsKPiArI2RlZmlu
ZSBEUlZfVkVSU0lPTiAgIjAuMSIKPiArI2RlZmluZSBEUlZfQVVUSE9SICAgIkphc29uIFdhbmcg
PGphc293YW5nQHJlZGhhdC5jb20+Igo+ICsjZGVmaW5lIERSVl9MSUNFTlNFICAiR1BMIHYyIgo+
ICsKPiArI2RlZmluZSBWRFBBU0lNX1FVRVVFX0FMSUdOIFBBR0VfU0laRQo+ICsjZGVmaW5lIFZE
UEFTSU1fUVVFVUVfTUFYIDI1Ngo+ICsjZGVmaW5lIFZEUEFTSU1fVkVORE9SX0lEIDAKPiArI2Rl
ZmluZSBWRFBBU0lNX1ZRX05VTSAweDIKPiArCj4gKyNkZWZpbmUgVkRQQVNJTV9GRUFUVVJFUwko
KDFVTEwgPDwgVklSVElPX0ZfQU5ZX0xBWU9VVCkgfCBcCj4gKwkJCQkgKDFVTEwgPDwgVklSVElP
X0ZfVkVSU0lPTl8xKSAgfCBcCj4gKwkJCQkgKDFVTEwgPDwgVklSVElPX0ZfQUNDRVNTX1BMQVRG
T1JNKSkKPiArCj4gK3N0cnVjdCB2ZHBhc2ltOwo+ICsKPiArc3RydWN0IHZkcGFzaW1fdmlydHF1
ZXVlIHsKPiArCXN0cnVjdCB2cmluZ2ggdnJpbmc7Cj4gKwlzdHJ1Y3QgdnJpbmdoX2tpb3YgaW92
Owo+ICsJdW5zaWduZWQgc2hvcnQgaGVhZDsKPiArCWJvb2wgcmVhZHk7Cj4gKwl1NjQgZGVzY19h
ZGRyOwo+ICsJdTY0IGRldmljZV9hZGRyOwo+ICsJdTY0IGRyaXZlcl9hZGRyOwo+ICsJdTMyIG51
bTsKPiArCXZvaWQgKnByaXZhdGU7Cj4gKwlpcnFyZXR1cm5fdCAoKmNiKSh2b2lkICpkYXRhKTsK
PiArfTsKPiArCj4gK3N0cnVjdCB2ZHBhc2ltX2luaXRfYXR0ciB7Cj4gKwl1MzIJCWRldmljZV9p
ZDsKPiArCXU2NAkJZmVhdHVyZXM7Cj4gKwl3b3JrX2Z1bmNfdAl3b3JrX2ZuOwo+ICsJaW50CQli
YXRjaF9tYXBwaW5nOwo+ICt9Owo+ICsKPiArLyogU3RhdGUgb2YgZWFjaCB2ZHBhc2ltIGRldmlj
ZSAqLwo+ICtzdHJ1Y3QgdmRwYXNpbSB7Cj4gKwlzdHJ1Y3QgdmRwYV9kZXZpY2UgdmRwYTsKPiAr
CXN0cnVjdCB2ZHBhc2ltX3ZpcnRxdWV1ZSB2cXNbVkRQQVNJTV9WUV9OVU1dOwo+ICsJc3RydWN0
IHdvcmtfc3RydWN0IHdvcms7Cj4gKwkvKiBzcGlubG9jayB0byBzeW5jaHJvbml6ZSB2aXJ0cXVl
dWUgc3RhdGUgKi8KPiArCXNwaW5sb2NrX3QgbG9jazsKPiArCS8qIHZpcnRpbyBjb25maWcgYWNj
b3JkaW5nIHRvIGRldmljZSB0eXBlICovCj4gKwl2b2lkICpjb25maWc7Cj4gKwlzdHJ1Y3Qgdmhv
c3RfaW90bGIgKmlvbW11Owo+ICsJdm9pZCAqYnVmZmVyOwo+ICsJdTMyIGRldmljZV9pZDsKPiAr
CXUzMiBzdGF0dXM7Cj4gKwl1MzIgZ2VuZXJhdGlvbjsKPiArCXU2NCBmZWF0dXJlczsKPiArCXU2
NCBzdXBwb3J0ZWRfZmVhdHVyZXM7Cj4gKwkvKiBzcGlubG9jayB0byBzeW5jaHJvbml6ZSBpb21t
dSB0YWJsZSAqLwo+ICsJc3BpbmxvY2tfdCBpb21tdV9sb2NrOwo+ICt9Owo+ICsKPiArc3RydWN0
IHZkcGFzaW0gKnZkcGFzaW1fY3JlYXRlKHN0cnVjdCB2ZHBhc2ltX2luaXRfYXR0ciAqYXR0cik7
Cj4gKwo+ICsvKiBUT0RPOiBjcm9zcy1lbmRpYW4gc3VwcG9ydCAqLwo+ICtzdGF0aWMgaW5saW5l
IGJvb2wgdmRwYXNpbV9pc19saXR0bGVfZW5kaWFuKHN0cnVjdCB2ZHBhc2ltICp2ZHBhc2ltKQo+
ICt7Cj4gKwlyZXR1cm4gdmlydGlvX2xlZ2FjeV9pc19saXR0bGVfZW5kaWFuKCkgfHwKPiArCQko
dmRwYXNpbS0+ZmVhdHVyZXMgJiAoMVVMTCA8PCBWSVJUSU9fRl9WRVJTSU9OXzEpKTsKPiArfQo+
ICsKPiArc3RhdGljIGlubGluZSB1MTYgdmRwYXNpbTE2X3RvX2NwdShzdHJ1Y3QgdmRwYXNpbSAq
dmRwYXNpbSwgX192aXJ0aW8xNiB2YWwpCj4gK3sKPiArCXJldHVybiBfX3ZpcnRpbzE2X3RvX2Nw
dSh2ZHBhc2ltX2lzX2xpdHRsZV9lbmRpYW4odmRwYXNpbSksIHZhbCk7Cj4gK30KPiArCj4gK3N0
YXRpYyBpbmxpbmUgX192aXJ0aW8xNiBjcHVfdG9fdmRwYXNpbTE2KHN0cnVjdCB2ZHBhc2ltICp2
ZHBhc2ltLCB1MTYgdmFsKQo+ICt7Cj4gKwlyZXR1cm4gX19jcHVfdG9fdmlydGlvMTYodmRwYXNp
bV9pc19saXR0bGVfZW5kaWFuKHZkcGFzaW0pLCB2YWwpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5s
aW5lIHUzMiB2ZHBhc2ltMzJfdG9fY3B1KHN0cnVjdCB2ZHBhc2ltICp2ZHBhc2ltLCBfX3ZpcnRp
bzMyIHZhbCkKPiArewo+ICsJcmV0dXJuIF9fdmlydGlvMzJfdG9fY3B1KHZkcGFzaW1faXNfbGl0
dGxlX2VuZGlhbih2ZHBhc2ltKSwgdmFsKTsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSBfX3Zp
cnRpbzMyIGNwdV90b192ZHBhc2ltMzIoc3RydWN0IHZkcGFzaW0gKnZkcGFzaW0sIHUzMiB2YWwp
Cj4gK3sKPiArCXJldHVybiBfX2NwdV90b192aXJ0aW8zMih2ZHBhc2ltX2lzX2xpdHRsZV9lbmRp
YW4odmRwYXNpbSksIHZhbCk7Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUgdTY0IHZkcGFzaW02
NF90b19jcHUoc3RydWN0IHZkcGFzaW0gKnZkcGFzaW0sIF9fdmlydGlvNjQgdmFsKQo+ICt7Cj4g
KwlyZXR1cm4gX192aXJ0aW82NF90b19jcHUodmRwYXNpbV9pc19saXR0bGVfZW5kaWFuKHZkcGFz
aW0pLCB2YWwpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIF9fdmlydGlvNjQgY3B1X3RvX3Zk
cGFzaW02NChzdHJ1Y3QgdmRwYXNpbSAqdmRwYXNpbSwgdTY0IHZhbCkKPiArewo+ICsJcmV0dXJu
IF9fY3B1X3RvX3ZpcnRpbzY0KHZkcGFzaW1faXNfbGl0dGxlX2VuZGlhbih2ZHBhc2ltKSwgdmFs
KTsKPiArfQo+ICsKPiArI2VuZGlmCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS92ZHBhX3Np
bS92ZHBhX3NpbS5jIGIvZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMKPiBpbmRleCA2
YTkwZmRiOWNiZmMuLjA0ZjlkYzljZThjOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEvdmRw
YV9zaW0vdmRwYV9zaW0uYwo+ICsrKyBiL2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5j
Cj4gQEAgLTEsMTA3ICsxLDE2IEBACj4gICAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5Cj4gICAvKgo+IC0gKiBWRFBBIG5ldHdvcmtpbmcgZGV2aWNlIHNpbXVsYXRvci4K
PiArICogVkRQQSBzaW11bGF0b3IgY29yZS4KPiAgICAqCj4gICAgKiBDb3B5cmlnaHQgKGMpIDIw
MjAsIFJlZCBIYXQgSW5jLiBBbGwgcmlnaHRzIHJlc2VydmVkLgo+ICAgICogICAgIEF1dGhvcjog
SmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiAgICAqCj4gICAgKi8KPiAgIAo+IC0j
aW5jbHVkZSA8bGludXgvaW5pdC5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+IC0j
aW5jbHVkZSA8bGludXgvZGV2aWNlLmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiAt
I2luY2x1ZGUgPGxpbnV4L2ZzLmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9wb2xsLmg+Cj4gLSNpbmNs
dWRlIDxsaW51eC9zbGFiLmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgo+IC0jaW5jbHVk
ZSA8bGludXgvd2FpdC5oPgo+IC0jaW5jbHVkZSA8bGludXgvdXVpZC5oPgo+IC0jaW5jbHVkZSA8
bGludXgvaW9tbXUuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9kbWEtbWFwLW9wcy5oPgo+IC0jaW5j
bHVkZSA8bGludXgvc3lzZnMuaD4KPiAtI2luY2x1ZGUgPGxpbnV4L2ZpbGUuaD4KPiAtI2luY2x1
ZGUgPGxpbnV4L2V0aGVyZGV2aWNlLmg+Cj4gLSNpbmNsdWRlIDxsaW51eC92cmluZ2guaD4KPiAt
I2luY2x1ZGUgPGxpbnV4L3ZkcGEuaD4KPiAtI2luY2x1ZGUgPGxpbnV4L3ZpcnRpb19ieXRlb3Jk
ZXIuaD4KPiAtI2luY2x1ZGUgPGxpbnV4L3Zob3N0X2lvdGxiLmg+Cj4gLSNpbmNsdWRlIDx1YXBp
L2xpbnV4L3ZpcnRpb19jb25maWcuaD4KPiAtI2luY2x1ZGUgPHVhcGkvbGludXgvdmlydGlvX25l
dC5oPgo+IC0KPiAtI2RlZmluZSBEUlZfVkVSU0lPTiAgIjAuMSIKPiAtI2RlZmluZSBEUlZfQVVU
SE9SICAgIkphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Igo+IC0jZGVmaW5lIERSVl9E
RVNDICAgICAidkRQQSBEZXZpY2UgU2ltdWxhdG9yIgo+IC0jZGVmaW5lIERSVl9MSUNFTlNFICAi
R1BMIHYyIgo+IC0KPiAtc3RhdGljIGludCBiYXRjaF9tYXBwaW5nID0gMTsKPiAtbW9kdWxlX3Bh
cmFtKGJhdGNoX21hcHBpbmcsIGludCwgMDQ0NCk7Cj4gLU1PRFVMRV9QQVJNX0RFU0MoYmF0Y2hf
bWFwcGluZywgIkJhdGNoZWQgbWFwcGluZyAxIC1FbmFibGU7IDAgLSBEaXNhYmxlIik7Cj4gLQo+
IC1zdGF0aWMgY2hhciAqbWFjYWRkcjsKPiAtbW9kdWxlX3BhcmFtKG1hY2FkZHIsIGNoYXJwLCAw
KTsKPiAtTU9EVUxFX1BBUk1fREVTQyhtYWNhZGRyLCAiRXRoZXJuZXQgTUFDIGFkZHJlc3MiKTsK
PiAtCj4gLXN0cnVjdCB2ZHBhc2ltX3ZpcnRxdWV1ZSB7Cj4gLQlzdHJ1Y3QgdnJpbmdoIHZyaW5n
Owo+IC0Jc3RydWN0IHZyaW5naF9raW92IGlvdjsKPiAtCXVuc2lnbmVkIHNob3J0IGhlYWQ7Cj4g
LQlib29sIHJlYWR5Owo+IC0JdTY0IGRlc2NfYWRkcjsKPiAtCXU2NCBkZXZpY2VfYWRkcjsKPiAt
CXU2NCBkcml2ZXJfYWRkcjsKPiAtCXUzMiBudW07Cj4gLQl2b2lkICpwcml2YXRlOwo+IC0JaXJx
cmV0dXJuX3QgKCpjYikodm9pZCAqZGF0YSk7Cj4gLX07Cj4gLQo+IC0jZGVmaW5lIFZEUEFTSU1f
UVVFVUVfQUxJR04gUEFHRV9TSVpFCj4gLSNkZWZpbmUgVkRQQVNJTV9RVUVVRV9NQVggMjU2Cj4g
LSNkZWZpbmUgVkRQQVNJTV9ERVZJQ0VfSUQgMHgxCj4gLSNkZWZpbmUgVkRQQVNJTV9WRU5ET1Jf
SUQgMAo+IC0jZGVmaW5lIFZEUEFTSU1fVlFfTlVNIDB4Mgo+IC0jZGVmaW5lIFZEUEFTSU1fTkFN
RSAidmRwYXNpbS1uZXRkZXYiCj4gLQo+IC1zdGF0aWMgdTY0IHZkcGFzaW1fZmVhdHVyZXMgPSAo
MVVMTCA8PCBWSVJUSU9fRl9BTllfTEFZT1VUKSB8Cj4gLQkJCSAgICAgICgxVUxMIDw8IFZJUlRJ
T19GX1ZFUlNJT05fMSkgIHwKPiAtCQkJICAgICAgKDFVTEwgPDwgVklSVElPX0ZfQUNDRVNTX1BM
QVRGT1JNKSB8Cj4gLQkJCSAgICAgICgxVUxMIDw8IFZJUlRJT19ORVRfRl9NQUMpOwo+IC0KPiAt
LyogU3RhdGUgb2YgZWFjaCB2ZHBhc2ltIGRldmljZSAqLwo+IC1zdHJ1Y3QgdmRwYXNpbSB7Cj4g
LQlzdHJ1Y3QgdmRwYV9kZXZpY2UgdmRwYTsKPiAtCXN0cnVjdCB2ZHBhc2ltX3ZpcnRxdWV1ZSB2
cXNbVkRQQVNJTV9WUV9OVU1dOwo+IC0Jc3RydWN0IHdvcmtfc3RydWN0IHdvcms7Cj4gLQkvKiBz
cGlubG9jayB0byBzeW5jaHJvbml6ZSB2aXJ0cXVldWUgc3RhdGUgKi8KPiAtCXNwaW5sb2NrX3Qg
bG9jazsKPiAtCXN0cnVjdCB2aXJ0aW9fbmV0X2NvbmZpZyBjb25maWc7Cj4gLQlzdHJ1Y3Qgdmhv
c3RfaW90bGIgKmlvbW11Owo+IC0Jdm9pZCAqYnVmZmVyOwo+IC0JdTMyIHN0YXR1czsKPiAtCXUz
MiBnZW5lcmF0aW9uOwo+IC0JdTY0IGZlYXR1cmVzOwo+IC0JLyogc3BpbmxvY2sgdG8gc3luY2hy
b25pemUgaW9tbXUgdGFibGUgKi8KPiAtCXNwaW5sb2NrX3QgaW9tbXVfbG9jazsKPiAtfTsKPiAt
Cj4gLS8qIFRPRE86IGNyb3NzLWVuZGlhbiBzdXBwb3J0ICovCj4gLXN0YXRpYyBpbmxpbmUgYm9v
bCB2ZHBhc2ltX2lzX2xpdHRsZV9lbmRpYW4oc3RydWN0IHZkcGFzaW0gKnZkcGFzaW0pCj4gLXsK
PiAtCXJldHVybiB2aXJ0aW9fbGVnYWN5X2lzX2xpdHRsZV9lbmRpYW4oKSB8fAo+IC0JCSh2ZHBh
c2ltLT5mZWF0dXJlcyAmICgxVUxMIDw8IFZJUlRJT19GX1ZFUlNJT05fMSkpOwo+IC19Cj4gLQo+
IC1zdGF0aWMgaW5saW5lIHUxNiB2ZHBhc2ltMTZfdG9fY3B1KHN0cnVjdCB2ZHBhc2ltICp2ZHBh
c2ltLCBfX3ZpcnRpbzE2IHZhbCkKPiAtewo+IC0JcmV0dXJuIF9fdmlydGlvMTZfdG9fY3B1KHZk
cGFzaW1faXNfbGl0dGxlX2VuZGlhbih2ZHBhc2ltKSwgdmFsKTsKPiAtfQo+IC0KPiAtc3RhdGlj
IGlubGluZSBfX3ZpcnRpbzE2IGNwdV90b192ZHBhc2ltMTYoc3RydWN0IHZkcGFzaW0gKnZkcGFz
aW0sIHUxNiB2YWwpCj4gLXsKPiAtCXJldHVybiBfX2NwdV90b192aXJ0aW8xNih2ZHBhc2ltX2lz
X2xpdHRsZV9lbmRpYW4odmRwYXNpbSksIHZhbCk7Cj4gLX0KPiAgIAo+IC1zdGF0aWMgc3RydWN0
IHZkcGFzaW0gKnZkcGFzaW1fZGV2Owo+ICsjaW5jbHVkZSAidmRwYV9zaW0uaCIKPiAgIAo+ICAg
c3RhdGljIHN0cnVjdCB2ZHBhc2ltICp2ZHBhX3RvX3NpbShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZk
cGEpCj4gICB7Cj4gQEAgLTExOSw3ICsyOCw3IEBAIHN0YXRpYyB2b2lkIHZkcGFzaW1fcXVldWVf
cmVhZHkoc3RydWN0IHZkcGFzaW0gKnZkcGFzaW0sIHVuc2lnbmVkIGludCBpZHgpCj4gICB7Cj4g
ICAJc3RydWN0IHZkcGFzaW1fdmlydHF1ZXVlICp2cSA9ICZ2ZHBhc2ltLT52cXNbaWR4XTsKPiAg
IAo+IC0JdnJpbmdoX2luaXRfaW90bGIoJnZxLT52cmluZywgdmRwYXNpbV9mZWF0dXJlcywKPiAr
CXZyaW5naF9pbml0X2lvdGxiKCZ2cS0+dnJpbmcsIHZkcGFzaW0tPnN1cHBvcnRlZF9mZWF0dXJl
cywKPiAgIAkJCSAgVkRQQVNJTV9RVUVVRV9NQVgsIGZhbHNlLAo+ICAgCQkJICAoc3RydWN0IHZy
aW5nX2Rlc2MgKikodWludHB0cl90KXZxLT5kZXNjX2FkZHIsCj4gICAJCQkgIChzdHJ1Y3QgdnJp
bmdfYXZhaWwgKikKPiBAQCAtMTI4LDcgKzM3LDggQEAgc3RhdGljIHZvaWQgdmRwYXNpbV9xdWV1
ZV9yZWFkeShzdHJ1Y3QgdmRwYXNpbSAqdmRwYXNpbSwgdW5zaWduZWQgaW50IGlkeCkKPiAgIAkJ
CSAgKHVpbnRwdHJfdCl2cS0+ZGV2aWNlX2FkZHIpOwo+ICAgfQo+ICAgCj4gLXN0YXRpYyB2b2lk
IHZkcGFzaW1fdnFfcmVzZXQoc3RydWN0IHZkcGFzaW1fdmlydHF1ZXVlICp2cSkKPiArc3RhdGlj
IHZvaWQgdmRwYXNpbV92cV9yZXNldChzdHJ1Y3QgdmRwYXNpbSAqdmRwYXNpbSwKPiArCQkJICAg
ICBzdHJ1Y3QgdmRwYXNpbV92aXJ0cXVldWUgKnZxKQo+ICAgewo+ICAgCXZxLT5yZWFkeSA9IGZh
bHNlOwo+ICAgCXZxLT5kZXNjX2FkZHIgPSAwOwo+IEBAIC0xMzYsOCArNDYsOCBAQCBzdGF0aWMg
dm9pZCB2ZHBhc2ltX3ZxX3Jlc2V0KHN0cnVjdCB2ZHBhc2ltX3ZpcnRxdWV1ZSAqdnEpCj4gICAJ
dnEtPmRldmljZV9hZGRyID0gMDsKPiAgIAl2cS0+Y2IgPSBOVUxMOwo+ICAgCXZxLT5wcml2YXRl
ID0gTlVMTDsKPiAtCXZyaW5naF9pbml0X2lvdGxiKCZ2cS0+dnJpbmcsIHZkcGFzaW1fZmVhdHVy
ZXMsIFZEUEFTSU1fUVVFVUVfTUFYLAo+IC0JCQkgIGZhbHNlLCBOVUxMLCBOVUxMLCBOVUxMKTsK
PiArCXZyaW5naF9pbml0X2lvdGxiKCZ2cS0+dnJpbmcsIHZkcGFzaW0tPnN1cHBvcnRlZF9mZWF0
dXJlcywKPiArCQkJICBWRFBBU0lNX1FVRVVFX01BWCwgZmFsc2UsIE5VTEwsIE5VTEwsIE5VTEwp
Owo+ICAgfQo+ICAgCj4gICBzdGF0aWMgdm9pZCB2ZHBhc2ltX3Jlc2V0KHN0cnVjdCB2ZHBhc2lt
ICp2ZHBhc2ltKQo+IEBAIC0xNDUsNyArNTUsNyBAQCBzdGF0aWMgdm9pZCB2ZHBhc2ltX3Jlc2V0
KHN0cnVjdCB2ZHBhc2ltICp2ZHBhc2ltKQo+ICAgCWludCBpOwo+ICAgCj4gICAJZm9yIChpID0g
MDsgaSA8IFZEUEFTSU1fVlFfTlVNOyBpKyspCj4gLQkJdmRwYXNpbV92cV9yZXNldCgmdmRwYXNp
bS0+dnFzW2ldKTsKPiArCQl2ZHBhc2ltX3ZxX3Jlc2V0KHZkcGFzaW0sICZ2ZHBhc2ltLT52cXNb
aV0pOwo+ICAgCj4gICAJc3Bpbl9sb2NrKCZ2ZHBhc2ltLT5pb21tdV9sb2NrKTsKPiAgIAl2aG9z
dF9pb3RsYl9yZXNldCh2ZHBhc2ltLT5pb21tdSk7Cj4gQEAgLTE1Niw4MCArNjYsNiBAQCBzdGF0
aWMgdm9pZCB2ZHBhc2ltX3Jlc2V0KHN0cnVjdCB2ZHBhc2ltICp2ZHBhc2ltKQo+ICAgCSsrdmRw
YXNpbS0+Z2VuZXJhdGlvbjsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgdm9pZCB2ZHBhc2ltX3dvcmso
c3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+IC17Cj4gLQlzdHJ1Y3QgdmRwYXNpbSAqdmRwYXNp
bSA9IGNvbnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3QKPiAtCQkJCQkJIHZkcGFzaW0sIHdvcmspOwo+
IC0Jc3RydWN0IHZkcGFzaW1fdmlydHF1ZXVlICp0eHEgPSAmdmRwYXNpbS0+dnFzWzFdOwo+IC0J
c3RydWN0IHZkcGFzaW1fdmlydHF1ZXVlICpyeHEgPSAmdmRwYXNpbS0+dnFzWzBdOwo+IC0Jc3Np
emVfdCByZWFkLCB3cml0ZTsKPiAtCXNpemVfdCB0b3RhbF93cml0ZTsKPiAtCWludCBwa3RzID0g
MDsKPiAtCWludCBlcnI7Cj4gLQo+IC0Jc3Bpbl9sb2NrKCZ2ZHBhc2ltLT5sb2NrKTsKPiAtCj4g
LQlpZiAoISh2ZHBhc2ltLT5zdGF0dXMgJiBWSVJUSU9fQ09ORklHX1NfRFJJVkVSX09LKSkKPiAt
CQlnb3RvIG91dDsKPiAtCj4gLQlpZiAoIXR4cS0+cmVhZHkgfHwgIXJ4cS0+cmVhZHkpCj4gLQkJ
Z290byBvdXQ7Cj4gLQo+IC0Jd2hpbGUgKHRydWUpIHsKPiAtCQl0b3RhbF93cml0ZSA9IDA7Cj4g
LQkJZXJyID0gdnJpbmdoX2dldGRlc2NfaW90bGIoJnR4cS0+dnJpbmcsICZ0eHEtPmlvdiwgTlVM
TCwKPiAtCQkJCQkgICAmdHhxLT5oZWFkLCBHRlBfQVRPTUlDKTsKPiAtCQlpZiAoZXJyIDw9IDAp
Cj4gLQkJCWJyZWFrOwo+IC0KPiAtCQllcnIgPSB2cmluZ2hfZ2V0ZGVzY19pb3RsYigmcnhxLT52
cmluZywgTlVMTCwgJnJ4cS0+aW92LAo+IC0JCQkJCSAgICZyeHEtPmhlYWQsIEdGUF9BVE9NSUMp
Owo+IC0JCWlmIChlcnIgPD0gMCkgewo+IC0JCQl2cmluZ2hfY29tcGxldGVfaW90bGIoJnR4cS0+
dnJpbmcsIHR4cS0+aGVhZCwgMCk7Cj4gLQkJCWJyZWFrOwo+IC0JCX0KPiAtCj4gLQkJd2hpbGUg
KHRydWUpIHsKPiAtCQkJcmVhZCA9IHZyaW5naF9pb3ZfcHVsbF9pb3RsYigmdHhxLT52cmluZywg
JnR4cS0+aW92LAo+IC0JCQkJCQkgICAgIHZkcGFzaW0tPmJ1ZmZlciwKPiAtCQkJCQkJICAgICBQ
QUdFX1NJWkUpOwo+IC0JCQlpZiAocmVhZCA8PSAwKQo+IC0JCQkJYnJlYWs7Cj4gLQo+IC0JCQl3
cml0ZSA9IHZyaW5naF9pb3ZfcHVzaF9pb3RsYigmcnhxLT52cmluZywgJnJ4cS0+aW92LAo+IC0J
CQkJCQkgICAgICB2ZHBhc2ltLT5idWZmZXIsIHJlYWQpOwo+IC0JCQlpZiAod3JpdGUgPD0gMCkK
PiAtCQkJCWJyZWFrOwo+IC0KPiAtCQkJdG90YWxfd3JpdGUgKz0gd3JpdGU7Cj4gLQkJfQo+IC0K
PiAtCQkvKiBNYWtlIHN1cmUgZGF0YSBpcyB3cm90ZSBiZWZvcmUgYWR2YW5jaW5nIGluZGV4ICov
Cj4gLQkJc21wX3dtYigpOwo+IC0KPiAtCQl2cmluZ2hfY29tcGxldGVfaW90bGIoJnR4cS0+dnJp
bmcsIHR4cS0+aGVhZCwgMCk7Cj4gLQkJdnJpbmdoX2NvbXBsZXRlX2lvdGxiKCZyeHEtPnZyaW5n
LCByeHEtPmhlYWQsIHRvdGFsX3dyaXRlKTsKPiAtCj4gLQkJLyogTWFrZSBzdXJlIHVzZWQgaXMg
dmlzaWJsZSBiZWZvcmUgcmFzaW5nIHRoZSBpbnRlcnJ1cHQuICovCj4gLQkJc21wX3dtYigpOwo+
IC0KPiAtCQlsb2NhbF9iaF9kaXNhYmxlKCk7Cj4gLQkJaWYgKHR4cS0+Y2IpCj4gLQkJCXR4cS0+
Y2IodHhxLT5wcml2YXRlKTsKPiAtCQlpZiAocnhxLT5jYikKPiAtCQkJcnhxLT5jYihyeHEtPnBy
aXZhdGUpOwo+IC0JCWxvY2FsX2JoX2VuYWJsZSgpOwo+IC0KPiAtCQlpZiAoKytwa3RzID4gNCkg
ewo+IC0JCQlzY2hlZHVsZV93b3JrKCZ2ZHBhc2ltLT53b3JrKTsKPiAtCQkJZ290byBvdXQ7Cj4g
LQkJfQo+IC0JfQo+IC0KPiAtb3V0Ogo+IC0Jc3Bpbl91bmxvY2soJnZkcGFzaW0tPmxvY2spOwo+
IC19Cj4gLQo+ICAgc3RhdGljIGludCBkaXJfdG9fcGVybShlbnVtIGRtYV9kYXRhX2RpcmVjdGlv
biBkaXIpCj4gICB7Cj4gICAJaW50IHBlcm0gPSAtRUZBVUxUOwo+IEBAIC0zNDIsMjYgKzE3OCw0
MiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtYV9tYXBfb3BzIHZkcGFzaW1fZG1hX29wcyA9IHsK
PiAgIAkuZnJlZSA9IHZkcGFzaW1fZnJlZV9jb2hlcmVudCwKPiAgIH07Cj4gICAKPiAtc3RhdGlj
IGNvbnN0IHN0cnVjdCB2ZHBhX2NvbmZpZ19vcHMgdmRwYXNpbV9uZXRfY29uZmlnX29wczsKPiAt
c3RhdGljIGNvbnN0IHN0cnVjdCB2ZHBhX2NvbmZpZ19vcHMgdmRwYXNpbV9uZXRfYmF0Y2hfY29u
ZmlnX29wczsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCB2ZHBhX2NvbmZpZ19vcHMgdmRwYXNpbV9j
b25maWdfb3BzOwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHZkcGFfY29uZmlnX29wcyB2ZHBhc2lt
X2JhdGNoX2NvbmZpZ19vcHM7Cj4gICAKPiAtc3RhdGljIHN0cnVjdCB2ZHBhc2ltICp2ZHBhc2lt
X2NyZWF0ZSh2b2lkKQo+ICtzdHJ1Y3QgdmRwYXNpbSAqdmRwYXNpbV9jcmVhdGUoc3RydWN0IHZk
cGFzaW1faW5pdF9hdHRyICphdHRyKQo+ICAgewo+ICAgCWNvbnN0IHN0cnVjdCB2ZHBhX2NvbmZp
Z19vcHMgKm9wczsKPiAgIAlzdHJ1Y3QgdmRwYXNpbSAqdmRwYXNpbTsKPiArCXUzMiBkZXZpY2Vf
aWQ7Cj4gICAJc3RydWN0IGRldmljZSAqZGV2Owo+IC0JaW50IHJldCA9IC1FTk9NRU07Cj4gKwlp
bnQgaSwgc2l6ZSwgcmV0ID0gLUVOT01FTTsKPiAgIAo+IC0JaWYgKGJhdGNoX21hcHBpbmcpCj4g
LQkJb3BzID0gJnZkcGFzaW1fbmV0X2JhdGNoX2NvbmZpZ19vcHM7Cj4gKwlkZXZpY2VfaWQgPSBh
dHRyLT5kZXZpY2VfaWQ7Cj4gKwkvKiBDdXJyZW50bHksIHdlIG9ubHkgYWNjZXB0IHRoZSBuZXR3
b3JrIGFuZCBibG9jayBkZXZpY2VzLiAqLwo+ICsJaWYgKGRldmljZV9pZCAhPSBWSVJUSU9fSURf
TkVUICYmIGRldmljZV9pZCAhPSBWSVJUSU9fSURfQkxPQ0spCj4gKwkJcmV0dXJuIEVSUl9QVFIo
LUVPUE5PVFNVUFApOwo+ICsKPiArCWlmIChhdHRyLT5iYXRjaF9tYXBwaW5nKQo+ICsJCW9wcyA9
ICZ2ZHBhc2ltX2JhdGNoX2NvbmZpZ19vcHM7Cj4gICAJZWxzZQo+IC0JCW9wcyA9ICZ2ZHBhc2lt
X25ldF9jb25maWdfb3BzOwo+ICsJCW9wcyA9ICZ2ZHBhc2ltX2NvbmZpZ19vcHM7Cj4gICAKPiAg
IAl2ZHBhc2ltID0gdmRwYV9hbGxvY19kZXZpY2Uoc3RydWN0IHZkcGFzaW0sIHZkcGEsIE5VTEws
IG9wcywgVkRQQVNJTV9WUV9OVU0pOwo+ICAgCWlmICghdmRwYXNpbSkKPiAgIAkJZ290byBlcnJf
YWxsb2M7Cj4gICAKPiAtCUlOSVRfV09SSygmdmRwYXNpbS0+d29yaywgdmRwYXNpbV93b3JrKTsK
PiArCWlmIChkZXZpY2VfaWQgPT0gVklSVElPX0lEX05FVCkKPiArCQlzaXplID0gc2l6ZW9mKHN0
cnVjdCB2aXJ0aW9fbmV0X2NvbmZpZyk7Cj4gKwllbHNlCj4gKwkJc2l6ZSA9IHNpemVvZihzdHJ1
Y3QgdmlydGlvX2Jsa19jb25maWcpOwoKCkl0J3MgYmV0dGVyIHRvIGF2b2lkIHN1Y2ggaWYvZWxz
ZSBjb25zaWRlciB3ZSBtYXkgaW50cm9kdWNlIG1vcmUgdHlwZSBvZiAKZGV2aWNlcy4KCkNhbiB3
ZSBoYXZlIGFuIGF0dHJpYnV0ZSBvZiBjb25maWcgc2l6ZSBpbnN0ZWFkPwoKCj4gKwl2ZHBhc2lt
LT5jb25maWcgPSBremFsbG9jKHNpemUsIEdGUF9LRVJORUwpOwo+ICsJaWYgKCF2ZHBhc2ltLT5j
b25maWcpCj4gKwkJZ290byBlcnJfaW9tbXU7Cj4gKwo+ICsJdmRwYXNpbS0+ZGV2aWNlX2lkID0g
ZGV2aWNlX2lkOwo+ICsJdmRwYXNpbS0+c3VwcG9ydGVkX2ZlYXR1cmVzID0gYXR0ci0+ZmVhdHVy
ZXM7Cj4gKwlJTklUX1dPUksoJnZkcGFzaW0tPndvcmssIGF0dHItPndvcmtfZm4pOwo+ICAgCXNw
aW5fbG9ja19pbml0KCZ2ZHBhc2ltLT5sb2NrKTsKPiAgIAlzcGluX2xvY2tfaW5pdCgmdmRwYXNp
bS0+aW9tbXVfbG9jayk7Cj4gICAKPiBAQCAtMzc5LDIzICsyMzEsMTAgQEAgc3RhdGljIHN0cnVj
dCB2ZHBhc2ltICp2ZHBhc2ltX2NyZWF0ZSh2b2lkKQo+ICAgCWlmICghdmRwYXNpbS0+YnVmZmVy
KQo+ICAgCQlnb3RvIGVycl9pb21tdTsKPiAgIAo+IC0JaWYgKG1hY2FkZHIpIHsKPiAtCQltYWNf
cHRvbihtYWNhZGRyLCB2ZHBhc2ltLT5jb25maWcubWFjKTsKPiAtCQlpZiAoIWlzX3ZhbGlkX2V0
aGVyX2FkZHIodmRwYXNpbS0+Y29uZmlnLm1hYykpIHsKPiAtCQkJcmV0ID0gLUVBRERSTk9UQVZB
SUw7Cj4gLQkJCWdvdG8gZXJyX2lvbW11Owo+IC0JCX0KPiAtCX0gZWxzZSB7Cj4gLQkJZXRoX3Jh
bmRvbV9hZGRyKHZkcGFzaW0tPmNvbmZpZy5tYWMpOwo+IC0JfQo+IC0KPiAtCXZyaW5naF9zZXRf
aW90bGIoJnZkcGFzaW0tPnZxc1swXS52cmluZywgdmRwYXNpbS0+aW9tbXUpOwo+IC0JdnJpbmdo
X3NldF9pb3RsYigmdmRwYXNpbS0+dnFzWzFdLnZyaW5nLCB2ZHBhc2ltLT5pb21tdSk7Cj4gKwlm
b3IgKGkgPSAwOyBpIDwgVkRQQVNJTV9WUV9OVU07IGkrKykKPiArCQl2cmluZ2hfc2V0X2lvdGxi
KCZ2ZHBhc2ltLT52cXNbaV0udnJpbmcsIHZkcGFzaW0tPmlvbW11KTsKCgpBbmQgYW4gYXR0cmli
dXRlIG9mICN2cXMgaGVyZS4KCgo+ICAgCj4gICAJdmRwYXNpbS0+dmRwYS5kbWFfZGV2ID0gZGV2
Owo+IC0JcmV0ID0gdmRwYV9yZWdpc3Rlcl9kZXZpY2UoJnZkcGFzaW0tPnZkcGEpOwo+IC0JaWYg
KHJldCkKPiAtCQlnb3RvIGVycl9pb21tdTsKPiAgIAo+ICAgCXJldHVybiB2ZHBhc2ltOwo+ICAg
Cj4gQEAgLTQwNCw2ICsyNDMsNyBAQCBzdGF0aWMgc3RydWN0IHZkcGFzaW0gKnZkcGFzaW1fY3Jl
YXRlKHZvaWQpCj4gICBlcnJfYWxsb2M6Cj4gICAJcmV0dXJuIEVSUl9QVFIocmV0KTsKPiAgIH0K
PiArRVhQT1JUX1NZTUJPTF9HUEwodmRwYXNpbV9jcmVhdGUpOwo+ICAgCj4gICBzdGF0aWMgaW50
IHZkcGFzaW1fc2V0X3ZxX2FkZHJlc3Moc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhLCB1MTYgaWR4
LAo+ICAgCQkJCSAgdTY0IGRlc2NfYXJlYSwgdTY0IGRyaXZlcl9hcmVhLAo+IEBAIC00OTgsMjgg
KzMzOCwzNCBAQCBzdGF0aWMgdTMyIHZkcGFzaW1fZ2V0X3ZxX2FsaWduKHN0cnVjdCB2ZHBhX2Rl
dmljZSAqdmRwYSkKPiAgIAo+ICAgc3RhdGljIHU2NCB2ZHBhc2ltX2dldF9mZWF0dXJlcyhzdHJ1
Y3QgdmRwYV9kZXZpY2UgKnZkcGEpCj4gICB7Cj4gLQlyZXR1cm4gdmRwYXNpbV9mZWF0dXJlczsK
PiArCXN0cnVjdCB2ZHBhc2ltICp2ZHBhc2ltID0gdmRwYV90b19zaW0odmRwYSk7Cj4gKwo+ICsJ
cmV0dXJuIHZkcGFzaW0tPnN1cHBvcnRlZF9mZWF0dXJlczsKPiAgIH0KPiAgIAo+ICAgc3RhdGlj
IGludCB2ZHBhc2ltX3NldF9mZWF0dXJlcyhzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEsIHU2NCBm
ZWF0dXJlcykKPiAgIHsKPiAgIAlzdHJ1Y3QgdmRwYXNpbSAqdmRwYXNpbSA9IHZkcGFfdG9fc2lt
KHZkcGEpOwo+IC0Jc3RydWN0IHZpcnRpb19uZXRfY29uZmlnICpjb25maWcgPSAmdmRwYXNpbS0+
Y29uZmlnOwo+ICAgCj4gICAJLyogRE1BIG1hcHBpbmcgbXVzdCBiZSBkb25lIGJ5IGRyaXZlciAq
Lwo+ICAgCWlmICghKGZlYXR1cmVzICYgKDFVTEwgPDwgVklSVElPX0ZfQUNDRVNTX1BMQVRGT1JN
KSkpCj4gICAJCXJldHVybiAtRUlOVkFMOwo+ICAgCj4gLQl2ZHBhc2ltLT5mZWF0dXJlcyA9IGZl
YXR1cmVzICYgdmRwYXNpbV9mZWF0dXJlczsKPiArCXZkcGFzaW0tPmZlYXR1cmVzID0gZmVhdHVy
ZXMgJiB2ZHBhc2ltLT5zdXBwb3J0ZWRfZmVhdHVyZXM7Cj4gICAKPiAgIAkvKiBXZSBnZW5lcmFs
bHkgb25seSBrbm93IHdoZXRoZXIgZ3Vlc3QgaXMgdXNpbmcgdGhlIGxlZ2FjeSBpbnRlcmZhY2UK
PiAgIAkgKiBoZXJlLCBzbyBnZW5lcmFsbHkgdGhhdCdzIHRoZSBlYXJsaWVzdCB3ZSBjYW4gc2V0
IGNvbmZpZyBmaWVsZHMuCj4gICAJICogTm90ZTogV2UgYWN0dWFsbHkgcmVxdWlyZSBWSVJUSU9f
Rl9BQ0NFU1NfUExBVEZPUk0gYWJvdmUgd2hpY2gKPiAgIAkgKiBpbXBsaWVzIFZJUlRJT19GX1ZF
UlNJT05fMSwgYnV0IGxldCdzIG5vdCB0cnkgdG8gYmUgY2xldmVyIGhlcmUuCj4gICAJICovCj4g
KwlpZiAodmRwYXNpbS0+ZGV2aWNlX2lkID09IFZJUlRJT19JRF9ORVQpIHsKPiArCQlzdHJ1Y3Qg
dmlydGlvX25ldF9jb25maWcgKmNvbmZpZyA9Cj4gKwkJCShzdHJ1Y3QgdmlydGlvX25ldF9jb25m
aWcgKil2ZHBhc2ltLT5jb25maWc7Cj4gKwo+ICsJCWNvbmZpZy0+bXR1ID0gY3B1X3RvX3ZkcGFz
aW0xNih2ZHBhc2ltLCAxNTAwKTsKPiArCQljb25maWctPnN0YXR1cyA9IGNwdV90b192ZHBhc2lt
MTYodmRwYXNpbSwgVklSVElPX05FVF9TX0xJTktfVVApOwo+ICsJfQoKCkNhbiB3ZSBpbnRyb2R1
Y2UgY2FsbGJhY2tzIG9mIHNldF9mZWF0dXJlcy9nZXRfZmVhdHVyZXMgaGVyZSB0byBhdm9pZCAK
ZGVhbGluZyBvZiBkZXZpY2UgdHlwZSBzcGVjaWZpYyBjb2RlcyBpbiBnZW5lcmljIHNpbXVsYXRv
ciBjb2RlPwoKCj4gICAKPiAtCWNvbmZpZy0+bXR1ID0gY3B1X3RvX3ZkcGFzaW0xNih2ZHBhc2lt
LCAxNTAwKTsKPiAtCWNvbmZpZy0+c3RhdHVzID0gY3B1X3RvX3ZkcGFzaW0xNih2ZHBhc2ltLCBW
SVJUSU9fTkVUX1NfTElOS19VUCk7Cj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gICAKPiBAQCAtNTM2
LDcgKzM4Miw5IEBAIHN0YXRpYyB1MTYgdmRwYXNpbV9nZXRfdnFfbnVtX21heChzdHJ1Y3QgdmRw
YV9kZXZpY2UgKnZkcGEpCj4gICAKPiAgIHN0YXRpYyB1MzIgdmRwYXNpbV9nZXRfZGV2aWNlX2lk
KHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYSkKPiAgIHsKPiAtCXJldHVybiBWRFBBU0lNX0RFVklD
RV9JRDsKPiArCXN0cnVjdCB2ZHBhc2ltICp2ZHBhc2ltID0gdmRwYV90b19zaW0odmRwYSk7Cj4g
Kwo+ICsJcmV0dXJuIHZkcGFzaW0tPmRldmljZV9pZDsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIHUz
MiB2ZHBhc2ltX2dldF92ZW5kb3JfaWQoc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhKQo+IEBAIC01
NzIsOCArNDIwLDEyIEBAIHN0YXRpYyB2b2lkIHZkcGFzaW1fZ2V0X2NvbmZpZyhzdHJ1Y3QgdmRw
YV9kZXZpY2UgKnZkcGEsIHVuc2lnbmVkIGludCBvZmZzZXQsCj4gICB7Cj4gICAJc3RydWN0IHZk
cGFzaW0gKnZkcGFzaW0gPSB2ZHBhX3RvX3NpbSh2ZHBhKTsKPiAgIAo+IC0JaWYgKG9mZnNldCAr
IGxlbiA8IHNpemVvZihzdHJ1Y3QgdmlydGlvX25ldF9jb25maWcpKQo+IC0JCW1lbWNweShidWYs
ICh1OCAqKSZ2ZHBhc2ltLT5jb25maWcgKyBvZmZzZXQsIGxlbik7Cj4gKwlpZiAodmRwYXNpbS0+
ZGV2aWNlX2lkID09IFZJUlRJT19JRF9CTE9DSyAmJgo+ICsJICAgIChvZmZzZXQgKyBsZW4gPCBz
aXplb2Yoc3RydWN0IHZpcnRpb19ibGtfY29uZmlnKSkpCj4gKwkJbWVtY3B5KGJ1ZiwgdmRwYXNp
bS0+Y29uZmlnICsgb2Zmc2V0LCBsZW4pOwo+ICsJZWxzZSBpZiAodmRwYXNpbS0+ZGV2aWNlX2lk
ID09IFZJUlRJT19JRF9ORVQgJiYKPiArCQkgKG9mZnNldCArIGxlbiA8IHNpemVvZihzdHJ1Y3Qg
dmlydGlvX25ldF9jb25maWcpKSkKPiArCQltZW1jcHkoYnVmLCB2ZHBhc2ltLT5jb25maWcgKyBv
ZmZzZXQsIGxlbik7CgoKU2ltaWxhcmx5LCBjYW4gd2UgaW50cm9kdWNlIHNldC9nZXRfY29uZmln
IG9wcz8KCgo+ICAgfQo+ICAgCj4gICBzdGF0aWMgdm9pZCB2ZHBhc2ltX3NldF9jb25maWcoc3Ry
dWN0IHZkcGFfZGV2aWNlICp2ZHBhLCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAo+IEBAIC02NTksOSAr
NTExLDEwIEBAIHN0YXRpYyB2b2lkIHZkcGFzaW1fZnJlZShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZk
cGEpCj4gICAJa2ZyZWUodmRwYXNpbS0+YnVmZmVyKTsKPiAgIAlpZiAodmRwYXNpbS0+aW9tbXUp
Cj4gICAJCXZob3N0X2lvdGxiX2ZyZWUodmRwYXNpbS0+aW9tbXUpOwo+ICsJa2ZyZWUodmRwYXNp
bS0+Y29uZmlnKTsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IHZkcGFfY29uZmln
X29wcyB2ZHBhc2ltX25ldF9jb25maWdfb3BzID0gewo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHZk
cGFfY29uZmlnX29wcyB2ZHBhc2ltX2NvbmZpZ19vcHMgPSB7Cj4gICAJLnNldF92cV9hZGRyZXNz
ICAgICAgICAgPSB2ZHBhc2ltX3NldF92cV9hZGRyZXNzLAo+ICAgCS5zZXRfdnFfbnVtICAgICAg
ICAgICAgID0gdmRwYXNpbV9zZXRfdnFfbnVtLAo+ICAgCS5raWNrX3ZxICAgICAgICAgICAgICAg
ID0gdmRwYXNpbV9raWNrX3ZxLAo+IEBAIC02ODgsNyArNTQxLDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCB2ZHBhX2NvbmZpZ19vcHMgdmRwYXNpbV9uZXRfY29uZmlnX29wcyA9IHsKPiAgIAkuZnJl
ZSAgICAgICAgICAgICAgICAgICA9IHZkcGFzaW1fZnJlZSwKPiAgIH07Cj4gICAKPiAtc3RhdGlj
IGNvbnN0IHN0cnVjdCB2ZHBhX2NvbmZpZ19vcHMgdmRwYXNpbV9uZXRfYmF0Y2hfY29uZmlnX29w
cyA9IHsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCB2ZHBhX2NvbmZpZ19vcHMgdmRwYXNpbV9iYXRj
aF9jb25maWdfb3BzID0gewo+ICAgCS5zZXRfdnFfYWRkcmVzcyAgICAgICAgID0gdmRwYXNpbV9z
ZXRfdnFfYWRkcmVzcywKPiAgIAkuc2V0X3ZxX251bSAgICAgICAgICAgICA9IHZkcGFzaW1fc2V0
X3ZxX251bSwKPiAgIAkua2lja192cSAgICAgICAgICAgICAgICA9IHZkcGFzaW1fa2lja192cSwK
PiBAQCAtNzE0LDI3ICs1NjcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHZkcGFfY29uZmlnX29w
cyB2ZHBhc2ltX25ldF9iYXRjaF9jb25maWdfb3BzID0gewo+ICAgCS5mcmVlICAgICAgICAgICAg
ICAgICAgID0gdmRwYXNpbV9mcmVlLAo+ICAgfTsKPiAgIAo+IC1zdGF0aWMgaW50IF9faW5pdCB2
ZHBhc2ltX2Rldl9pbml0KHZvaWQpCj4gLXsKPiAtCXZkcGFzaW1fZGV2ID0gdmRwYXNpbV9jcmVh
dGUoKTsKPiAtCj4gLQlpZiAoIUlTX0VSUih2ZHBhc2ltX2RldikpCj4gLQkJcmV0dXJuIDA7Cj4g
LQo+IC0JcmV0dXJuIFBUUl9FUlIodmRwYXNpbV9kZXYpOwo+IC19Cj4gLQo+IC1zdGF0aWMgdm9p
ZCBfX2V4aXQgdmRwYXNpbV9kZXZfZXhpdCh2b2lkKQo+IC17Cj4gLQlzdHJ1Y3QgdmRwYV9kZXZp
Y2UgKnZkcGEgPSAmdmRwYXNpbV9kZXYtPnZkcGE7Cj4gLQo+IC0JdmRwYV91bnJlZ2lzdGVyX2Rl
dmljZSh2ZHBhKTsKPiAtfQo+IC0KPiAtbW9kdWxlX2luaXQodmRwYXNpbV9kZXZfaW5pdCkKPiAt
bW9kdWxlX2V4aXQodmRwYXNpbV9kZXZfZXhpdCkKPiAtCj4gICBNT0RVTEVfVkVSU0lPTihEUlZf
VkVSU0lPTik7Cj4gICBNT0RVTEVfTElDRU5TRShEUlZfTElDRU5TRSk7Cj4gICBNT0RVTEVfQVVU
SE9SKERSVl9BVVRIT1IpOwo+IC1NT0RVTEVfREVTQ1JJUFRJT04oRFJWX0RFU0MpOwo+ICtNT0RV
TEVfREVTQ1JJUFRJT04oInZEUEEgU2ltdWxhdG9yIGNvcmUiKTsKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltX25ldC5jIGIvZHJpdmVycy92ZHBhL3ZkcGFfc2lt
L3ZkcGFfc2ltX25ldC5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAw
MDAuLmM2OGQ1NDg4YWI1NAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9kcml2ZXJzL3ZkcGEvdmRw
YV9zaW0vdmRwYV9zaW1fbmV0LmMKPiBAQCAtMCwwICsxLDE1MyBAQAo+ICsvLyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4gKy8qCj4gKyAqIFZEUEEgc2ltdWxhdG9yIGZv
ciBuZXR3b3JraW5nIGRldmljZS4KPiArICoKPiArICogQ29weXJpZ2h0IChjKSAyMDIwLCBSZWQg
SGF0IEluYy4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KPiArICogICAgIEF1dGhvcjogSmFzb24gV2Fu
ZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiArICoKPiArICovCj4gKwo+ICsjaW5jbHVkZSA8bGlu
dXgvbW9kdWxlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9ldGhlcmRldmljZS5oPgo+ICsKPiArI2lu
Y2x1ZGUgInZkcGFfc2ltLmgiCj4gKwo+ICsjZGVmaW5lIFZEUEFTSU1fTkVUX0ZFQVRVUkVTCSgx
VUxMIDw8IFZJUlRJT19ORVRfRl9NQUMpCj4gKwo+ICtzdGF0aWMgaW50IGJhdGNoX21hcHBpbmcg
PSAxOwo+ICttb2R1bGVfcGFyYW0oYmF0Y2hfbWFwcGluZywgaW50LCAwNDQ0KTsKPiArTU9EVUxF
X1BBUk1fREVTQyhiYXRjaF9tYXBwaW5nLCAiQmF0Y2hlZCBtYXBwaW5nIDEgLSBFbmFibGU7IDAg
LSBEaXNhYmxlIik7CgoKSSB0aGluayBiYXRjaF9tYXBwaW5nIHNob3VsZCBiZWxvbmcgdG8gdnBk
YV9zaW0gY29yZSBtb2R1bGUuCgoKPiArCj4gK3N0YXRpYyBjaGFyICptYWNhZGRyOwo+ICttb2R1
bGVfcGFyYW0obWFjYWRkciwgY2hhcnAsIDApOwo+ICtNT0RVTEVfUEFSTV9ERVNDKG1hY2FkZHIs
ICJFdGhlcm5ldCBNQUMgYWRkcmVzcyIpOwo+ICsKPiArc3RhdGljIHN0cnVjdCB2ZHBhc2ltICp2
ZHBhc2ltX25ldF9kZXY7Cj4gKwo+ICtzdGF0aWMgdm9pZCB2ZHBhc2ltX25ldF93b3JrKHN0cnVj
dCB3b3JrX3N0cnVjdCAqd29yaykKPiArewo+ICsJc3RydWN0IHZkcGFzaW0gKnZkcGFzaW0gPSBj
b250YWluZXJfb2Yod29yaywgc3RydWN0IHZkcGFzaW0sIHdvcmspOwo+ICsJc3RydWN0IHZkcGFz
aW1fdmlydHF1ZXVlICp0eHEgPSAmdmRwYXNpbS0+dnFzWzFdOwo+ICsJc3RydWN0IHZkcGFzaW1f
dmlydHF1ZXVlICpyeHEgPSAmdmRwYXNpbS0+dnFzWzBdOwo+ICsJc3NpemVfdCByZWFkLCB3cml0
ZTsKPiArCXNpemVfdCB0b3RhbF93cml0ZTsKPiArCWludCBwa3RzID0gMDsKPiArCWludCBlcnI7
Cj4gKwo+ICsJc3Bpbl9sb2NrKCZ2ZHBhc2ltLT5sb2NrKTsKPiArCj4gKwlpZiAoISh2ZHBhc2lt
LT5zdGF0dXMgJiBWSVJUSU9fQ09ORklHX1NfRFJJVkVSX09LKSkKPiArCQlnb3RvIG91dDsKPiAr
Cj4gKwlpZiAoIXR4cS0+cmVhZHkgfHwgIXJ4cS0+cmVhZHkpCj4gKwkJZ290byBvdXQ7Cj4gKwo+
ICsJd2hpbGUgKHRydWUpIHsKPiArCQl0b3RhbF93cml0ZSA9IDA7Cj4gKwkJZXJyID0gdnJpbmdo
X2dldGRlc2NfaW90bGIoJnR4cS0+dnJpbmcsICZ0eHEtPmlvdiwgTlVMTCwKPiArCQkJCQkgICAm
dHhxLT5oZWFkLCBHRlBfQVRPTUlDKTsKPiArCQlpZiAoZXJyIDw9IDApCj4gKwkJCWJyZWFrOwo+
ICsKPiArCQllcnIgPSB2cmluZ2hfZ2V0ZGVzY19pb3RsYigmcnhxLT52cmluZywgTlVMTCwgJnJ4
cS0+aW92LAo+ICsJCQkJCSAgICZyeHEtPmhlYWQsIEdGUF9BVE9NSUMpOwo+ICsJCWlmIChlcnIg
PD0gMCkgewo+ICsJCQl2cmluZ2hfY29tcGxldGVfaW90bGIoJnR4cS0+dnJpbmcsIHR4cS0+aGVh
ZCwgMCk7Cj4gKwkJCWJyZWFrOwo+ICsJCX0KPiArCj4gKwkJd2hpbGUgKHRydWUpIHsKPiArCQkJ
cmVhZCA9IHZyaW5naF9pb3ZfcHVsbF9pb3RsYigmdHhxLT52cmluZywgJnR4cS0+aW92LAo+ICsJ
CQkJCQkgICAgIHZkcGFzaW0tPmJ1ZmZlciwKPiArCQkJCQkJICAgICBQQUdFX1NJWkUpOwo+ICsJ
CQlpZiAocmVhZCA8PSAwKQo+ICsJCQkJYnJlYWs7Cj4gKwo+ICsJCQl3cml0ZSA9IHZyaW5naF9p
b3ZfcHVzaF9pb3RsYigmcnhxLT52cmluZywgJnJ4cS0+aW92LAo+ICsJCQkJCQkgICAgICB2ZHBh
c2ltLT5idWZmZXIsIHJlYWQpOwo+ICsJCQlpZiAod3JpdGUgPD0gMCkKPiArCQkJCWJyZWFrOwo+
ICsKPiArCQkJdG90YWxfd3JpdGUgKz0gd3JpdGU7Cj4gKwkJfQo+ICsKPiArCQkvKiBNYWtlIHN1
cmUgZGF0YSBpcyB3cm90ZSBiZWZvcmUgYWR2YW5jaW5nIGluZGV4ICovCj4gKwkJc21wX3dtYigp
Owo+ICsKPiArCQl2cmluZ2hfY29tcGxldGVfaW90bGIoJnR4cS0+dnJpbmcsIHR4cS0+aGVhZCwg
MCk7Cj4gKwkJdnJpbmdoX2NvbXBsZXRlX2lvdGxiKCZyeHEtPnZyaW5nLCByeHEtPmhlYWQsIHRv
dGFsX3dyaXRlKTsKPiArCj4gKwkJLyogTWFrZSBzdXJlIHVzZWQgaXMgdmlzaWJsZSBiZWZvcmUg
cmFzaW5nIHRoZSBpbnRlcnJ1cHQuICovCj4gKwkJc21wX3dtYigpOwo+ICsKPiArCQlsb2NhbF9i
aF9kaXNhYmxlKCk7Cj4gKwkJaWYgKHR4cS0+Y2IpCj4gKwkJCXR4cS0+Y2IodHhxLT5wcml2YXRl
KTsKPiArCQlpZiAocnhxLT5jYikKPiArCQkJcnhxLT5jYihyeHEtPnByaXZhdGUpOwo+ICsJCWxv
Y2FsX2JoX2VuYWJsZSgpOwo+ICsKPiArCQlpZiAoKytwa3RzID4gNCkgewo+ICsJCQlzY2hlZHVs
ZV93b3JrKCZ2ZHBhc2ltLT53b3JrKTsKPiArCQkJZ290byBvdXQ7Cj4gKwkJfQo+ICsJfQo+ICsK
PiArb3V0Ogo+ICsJc3Bpbl91bmxvY2soJnZkcGFzaW0tPmxvY2spOwo+ICt9Cj4gKwo+ICtzdGF0
aWMgaW50IF9faW5pdCB2ZHBhc2ltX25ldF9pbml0KHZvaWQpCj4gK3sKPiArCXN0cnVjdCB2ZHBh
c2ltX2luaXRfYXR0ciBhdHRyID0ge307Cj4gKwlzdHJ1Y3QgdmlydGlvX25ldF9jb25maWcgKmNv
bmZpZzsKPiArCWludCByZXQ7Cj4gKwo+ICsJYXR0ci5kZXZpY2VfaWQgPSBWSVJUSU9fSURfTkVU
Owo+ICsJYXR0ci5mZWF0dXJlcyA9IFZEUEFTSU1fRkVBVFVSRVMgfCBWRFBBU0lNX05FVF9GRUFU
VVJFUzsKPiArCWF0dHIud29ya19mbiA9IHZkcGFzaW1fbmV0X3dvcms7Cj4gKwlhdHRyLmJhdGNo
X21hcHBpbmcgPSBiYXRjaF9tYXBwaW5nOwo+ICsJdmRwYXNpbV9uZXRfZGV2ID0gdmRwYXNpbV9j
cmVhdGUoJmF0dHIpOwo+ICsJaWYgKElTX0VSUih2ZHBhc2ltX25ldF9kZXYpKSB7Cj4gKwkJcmV0
ID0gUFRSX0VSUih2ZHBhc2ltX25ldF9kZXYpOwo+ICsJCWdvdG8gb3V0Owo+ICsJfQo+ICsKPiAr
CWNvbmZpZyA9IChzdHJ1Y3QgdmlydGlvX25ldF9jb25maWcgKil2ZHBhc2ltX25ldF9kZXYtPmNv
bmZpZzsKPiArCj4gKwlpZiAobWFjYWRkcikgewo+ICsJCW1hY19wdG9uKG1hY2FkZHIsIGNvbmZp
Zy0+bWFjKTsKPiArCQlpZiAoIWlzX3ZhbGlkX2V0aGVyX2FkZHIoY29uZmlnLT5tYWMpKSB7Cj4g
KwkJCXJldCA9IC1FQUREUk5PVEFWQUlMOwo+ICsJCQlnb3RvIHB1dF9kZXY7Cj4gKwkJfQo+ICsJ
fSBlbHNlIHsKPiArCQlldGhfcmFuZG9tX2FkZHIoY29uZmlnLT5tYWMpOwo+ICsJfQo+ICsKPiAr
CXJldCA9IHZkcGFfcmVnaXN0ZXJfZGV2aWNlKCZ2ZHBhc2ltX25ldF9kZXYtPnZkcGEpOwo+ICsJ
aWYgKHJldCkKPiArCQlnb3RvIHB1dF9kZXY7Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gKwo+ICtwdXRf
ZGV2Ogo+ICsJcHV0X2RldmljZSgmdmRwYXNpbV9uZXRfZGV2LT52ZHBhLmRldik7Cj4gK291dDoK
PiArCXJldHVybiByZXQ7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIF9fZXhpdCB2ZHBhc2ltX25l
dF9leGl0KHZvaWQpCj4gK3sKPiArCXN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYSA9ICZ2ZHBhc2lt
X25ldF9kZXYtPnZkcGE7Cj4gKwo+ICsJdmRwYV91bnJlZ2lzdGVyX2RldmljZSh2ZHBhKTsKPiAr
fQo+ICsKPiArbW9kdWxlX2luaXQodmRwYXNpbV9uZXRfaW5pdCk7Cj4gK21vZHVsZV9leGl0KHZk
cGFzaW1fbmV0X2V4aXQpOwo+ICsKPiArTU9EVUxFX1ZFUlNJT04oRFJWX1ZFUlNJT04pOwo+ICtN
T0RVTEVfTElDRU5TRShEUlZfTElDRU5TRSk7Cj4gK01PRFVMRV9BVVRIT1IoRFJWX0FVVEhPUik7
Cj4gK01PRFVMRV9ERVNDUklQVElPTigidkRQQSBEZXZpY2UgU2ltdWxhdG9yIGZvciBuZXR3b3Jr
aW5nIGRldmljZSIpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZkcGEvS2NvbmZpZyBiL2RyaXZl
cnMvdmRwYS9LY29uZmlnCj4gaW5kZXggZDdkMzJiNjU2MTAyLi5mZGIxYTkyNjczNDcgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy92ZHBhL0tjb25maWcKPiArKysgYi9kcml2ZXJzL3ZkcGEvS2NvbmZp
Zwo+IEBAIC05LDExICs5LDE2IEBAIG1lbnVjb25maWcgVkRQQQo+ICAgaWYgVkRQQQo+ICAgCj4g
ICBjb25maWcgVkRQQV9TSU0KPiAtCXRyaXN0YXRlICJ2RFBBIGRldmljZSBzaW11bGF0b3IiCj4g
Kwl0cmlzdGF0ZSAidkRQQSBzaW11bGF0b3IgY29yZSIKPiAgIAlkZXBlbmRzIG9uIFJVTlRJTUVf
VEVTVElOR19NRU5VICYmIEhBU19ETUEKPiAgIAlzZWxlY3QgRE1BX09QUwo+ICAgCXNlbGVjdCBW
SE9TVF9SSU5HCj4gICAJZGVmYXVsdCBuCj4gKwo+ICtjb25maWcgVkRQQV9TSU1fTkVUCj4gKwl0
cmlzdGF0ZSAidkRQQSBzaW11bGF0b3IgZm9yIG5ldHdvcmtpbmcgZGV2aWNlIgo+ICsJZGVwZW5k
cyBvbiBWRFBBX1NJTQo+ICsJZGVmYXVsdCBuCgoKSSByZW1lbWJlciBzb21lYm9keSB0b2xkIG1l
IHRoYXQgaWYgd2UgZG9uJ3QgZW5hYmxlIGEgbW9kdWxlIGl0IHdhcyAKZGlzYWJsZWQgYnkgZGVm
YXVsdC4KClRoYW5rcwoKCj4gICAJaGVscAo+ICAgCSAgdkRQQSBuZXR3b3JraW5nIGRldmljZSBz
aW11bGF0b3Igd2hpY2ggbG9vcCBUWCB0cmFmZmljIGJhY2sKPiAgIAkgIHRvIFJYLiBUaGlzIGRl
dmljZSBpcyB1c2VkIGZvciB0ZXN0aW5nLCBwcm90b3R5cGluZyBhbmQKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92ZHBhL3ZkcGFfc2ltL01ha2VmaWxlIGIvZHJpdmVycy92ZHBhL3ZkcGFfc2ltL01h
a2VmaWxlCj4gaW5kZXggYjQwMjc4ZjY1ZTA0Li43OWQ0NTM2ZDM0N2UgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy92ZHBhL3ZkcGFfc2ltL01ha2VmaWxlCj4gKysrIGIvZHJpdmVycy92ZHBhL3ZkcGFf
c2ltL01ha2VmaWxlCj4gQEAgLTEsMiArMSwzIEBACj4gICAjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wCj4gICBvYmotJChDT05GSUdfVkRQQV9TSU0pICs9IHZkcGFfc2ltLm8KPiAr
b2JqLSQoQ09ORklHX1ZEUEFfU0lNX05FVCkgKz0gdmRwYV9zaW1fbmV0Lm8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
