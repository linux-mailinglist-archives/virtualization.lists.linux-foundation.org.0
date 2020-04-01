Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C5D19AE3A
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 16:44:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9FF7986D90;
	Wed,  1 Apr 2020 14:44:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P9ZxK9e3RBDT; Wed,  1 Apr 2020 14:44:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B42F186DD6;
	Wed,  1 Apr 2020 14:44:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9AFCCC089F;
	Wed,  1 Apr 2020 14:44:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36573C089F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1DC72883F1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NTGcHkvD95jT
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:44:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 686D2883E2
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585752261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3BPU8cwn4wg2zbZqCCchSQUn3Ax59cAUAtMjE3S7aOY=;
 b=PSP5z55BGcrTVpl0VbzMHuDmBkFWkSg3KSrqniNJoi+lKEAQ0Xl6xYs/HVudP0WupAlOe0
 VgL/jFyoImMmFJbid5Mg7/Wu36bsxKKGDkGcm4GRzVycDSY/V0NrKDp0QwtLn9lzip6q8u
 x6C7wwkR1i+zoTgMiVQfaCK7k186VPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-bqPjN9Y6N3-rZRk9X2Igbg-1; Wed, 01 Apr 2020 10:44:18 -0400
X-MC-Unique: bqPjN9Y6N3-rZRk9X2Igbg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DDBF193578B;
 Wed,  1 Apr 2020 14:44:15 +0000 (UTC)
Received: from [10.72.12.139] (ovpn-12-139.pek2.redhat.com [10.72.12.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56B7E98A53;
 Wed,  1 Apr 2020 14:43:58 +0000 (UTC)
Subject: Re: [PATCH V9 1/9] vhost: refine vhost and vringh kconfig
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-2-jasowang@redhat.com>
 <20200401092004-mutt-send-email-mst@kernel.org>
 <6b4d169a-9962-6014-5423-1507059343e9@redhat.com>
 <20200401100954-mutt-send-email-mst@kernel.org>
 <3dd3b7e7-e3d9-dba4-00fc-868081f95ab7@redhat.com>
 <20200401103659-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <12f0ff8f-cdf2-9aac-883c-48c39138b7ea@redhat.com>
Date: Wed, 1 Apr 2020 22:43:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200401103659-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: kvm@vger.kernel.org, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, jgg@mellanox.com, shahafs@mellanox.com,
 parav@mellanox.com, vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 zhangweining@ruijie.com.cn, netdev@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
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

Ck9uIDIwMjAvNC8xIOS4i+WNiDEwOjM5LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+ID5G
cm9tIDliM2E1ZDIzYjhiZjZiMGExMWU2NWU2ODgzMzVkNzgyZjhlNmFhNWMgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCj4+IEZyb206IEphc29uIFdhbmc8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4g
RGF0ZTogV2VkLCAxIEFwciAyMDIwIDIyOjE3OjI3ICswODAwCj4+IFN1YmplY3Q6IFtQQVRDSF0g
dmhvc3Q6IGxldCBDT05GSUdfVkhPU1QgdG8gYmUgc2VsZWN0ZWQgYnkgZHJpdmVycwo+Pgo+PiBU
aGUgZGVmY29uZmlnIG9uIHNvbWUgYXJjaHMgZW5hYmxlIHZob3N0X25ldCBvciB2aG9zdF92c29j
ayBieQo+PiBkZWZhdWx0LiBTbyBpbnN0ZWFkIG9mIGFkZGluZyBDT05GSUdfVkhPU1Q9bSB0byBh
bGwgb2YgdGhvc2UgZmlsZXMsCj4+IHNpbXBseSBsZXR0aW5nIENPTkZJR19WSE9TVCB0byBiZSBz
ZWxlY3RlZCBieSBhbGwgb2YgdGhlIHZob3N0Cj4+IGRyaXZlcnMuIFRoaXMgZml4ZXMgdGhlIGJ1
aWxkIG9uIHRoZSBhcmNocyB3aXRoIENPTkZJR19WSE9TVF9ORVQ9bSBpbgo+PiB0aGVpciBkZWZj
b25maWcuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmc8amFzb3dhbmdAcmVkaGF0LmNv
bT4KPj4gLS0tCj4+ICAgZHJpdmVycy92aG9zdC9LY29uZmlnIHwgMTUgKysrKysrKysrKystLS0t
Cj4+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L0tjb25maWcgYi9kcml2ZXJzL3Zob3N0L0tj
b25maWcKPj4gaW5kZXggMjUyM2ExZDQyOTBhLi4zNjJiODMyZjUzMzggMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL3Zob3N0L0tjb25maWcKPj4g
QEAgLTExLDE5ICsxMSwyMyBAQCBjb25maWcgVkhPU1RfUklORwo+PiAgIAkgIFRoaXMgb3B0aW9u
IGlzIHNlbGVjdGVkIGJ5IGFueSBkcml2ZXIgd2hpY2ggbmVlZHMgdG8gYWNjZXNzCj4+ICAgCSAg
dGhlIGhvc3Qgc2lkZSBvZiBhIHZpcnRpbyByaW5nLgo+PiAgIAo+PiAtbWVudWNvbmZpZyBWSE9T
VAo+PiAtCXRyaXN0YXRlICJIb3N0IGtlcm5lbCBhY2NlbGVyYXRvciBmb3IgdmlydGlvIChWSE9T
VCkiCj4+IC0JZGVwZW5kcyBvbiBFVkVOVEZECj4+ICtjb25maWcgVkhPU1QKPj4gKwl0cmlzdGF0
ZQo+PiAgIAlzZWxlY3QgVkhPU1RfSU9UTEIKPj4gICAJaGVscAo+PiAgIAkgIFRoaXMgb3B0aW9u
IGlzIHNlbGVjdGVkIGJ5IGFueSBkcml2ZXIgd2hpY2ggbmVlZHMgdG8gYWNjZXNzCj4+ICAgCSAg
dGhlIGNvcmUgb2Ygdmhvc3QuCj4+ICAgCj4+IC1pZiBWSE9TVAo+PiArbWVudWNvbmZpZyBWSE9T
VF9NRU5VCj4+ICsJYm9vbCAiVkhPU1QgZHJpdmVycyIKPj4gKwlkZWZhdWx0IHkKPj4gKwo+PiAr
aWYgVkhPU1RfTUVOVQo+IEluIGZhY3QgdGhpcyBpcyBzaW1pbGFyIHRvIFZJUlRJTywgYW5kIEkg
d29uZGVyIHdoZXRoZXIgVklSVElPIGhhcyBhbHNvCj4gYmVlbiBicm9rZW4gYnkKPiAJY29tbWl0
IDdiOTVmZWM2ZDJmZmE1M2Y0YThkNjM3YjBmMjIzNjQ0ZDQ1OGVhNGUKPiAJQXV0aG9yOiBWaW5j
ZW50IExlZ29sbDx2aW5jZW50LmxlZ29sbEBnbWFpbC5jb20+Cj4gCURhdGU6ICAgU3VuIEphbiA3
IDEyOjMzOjU2IDIwMTggKzAxMDAKPgo+IAkgICAgdmlydGlvOiBtYWtlIFZJUlRJTyBhIG1lbnVj
b25maWcgdG8gZWFzZSBkaXNhYmxpbmcgaXQgYWxsCj4KPiBJIHNlZSBsb3RzIG9mIGRlZmNvbmZp
Z3Mgc2V0IFZJUlRJT19QQ0kgYnV0IG5vdCBWSVJUSU9fTUVOVSAuLi4KCgpQcm9iYWJseSBub3Qg
c2luY2UgVklSVElPX01FTlUgaGFzICJkZWZhdWx0IHkiCgpFLmcgZm9yIHBvd2VycGMsIEkgZ290
OgoKIyBtYWtlIEFSQ0g9cG93ZXJwYyBkZWZjb25maWcKKioqIERlZmF1bHQgY29uZmlndXJhdGlv
biBpcyBiYXNlZCBvbiAncHBjNjRfZGVmY29uZmlnJwojCiMgTm8gY2hhbmdlIHRvIC5jb25maWcK
IwojIGdyZXAgQ09ORklHX1ZJUlRJTyAuY29uZmlnCkNPTkZJR19WSVJUSU9fQkxLPW0KQ09ORklH
X1ZJUlRJT19ORVQ9bQpDT05GSUdfVklSVElPX0NPTlNPTEU9bQpDT05GSUdfVklSVElPPW0KQ09O
RklHX1ZJUlRJT19NRU5VPXkKQ09ORklHX1ZJUlRJT19QQ0k9bQpDT05GSUdfVklSVElPX1BDSV9M
RUdBQ1k9eQojIENPTkZJR19WSVJUSU9fVkRQQSBpcyBub3Qgc2V0CkNPTkZJR19WSVJUSU9fQkFM
TE9PTj1tCiMgQ09ORklHX1ZJUlRJT19JTlBVVCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJUlRJT19N
TUlPIGlzIG5vdCBzZXQKIyBDT05GSUdfVklSVElPX0ZTIGlzIG5vdCBzZXQKClRoYW5rcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
