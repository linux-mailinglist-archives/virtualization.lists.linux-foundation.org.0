Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE79165714
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 06:41:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D0B9D2078B;
	Thu, 20 Feb 2020 05:41:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MUKvBu4bIQ7N; Thu, 20 Feb 2020 05:41:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E54E02051F;
	Thu, 20 Feb 2020 05:41:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B487FC013E;
	Thu, 20 Feb 2020 05:41:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27C04C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 05:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1689183DA4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 05:41:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v+FfpKLYWs+F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 05:41:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7843A8389C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 05:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582177278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V8v5166J4SbhdR4e6T70Bx8eG2hcXpRERfrbWLPrkP0=;
 b=g1nxG7ihS9hkOMh8nAoncu/rVxNBFTIya9GwdzG2uI7tgJwCul6Fdv1nJ/rFr1BROodiKD
 7ozUfvhsMW7F6XfaBIAnizSPZrd/rhX72EALkV4w0vWxfupRS6E5Pnl+AJHjI2i59NDKTo
 mrBVh1Cn3vhVfmajVQO5DJfvkDs6/Ew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110--XF2wSw1MSiPuumGVPBXeQ-1; Thu, 20 Feb 2020 00:41:16 -0500
X-MC-Unique: -XF2wSw1MSiPuumGVPBXeQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DC1618A6EC2;
 Thu, 20 Feb 2020 05:41:14 +0000 (UTC)
Received: from [10.72.12.159] (ovpn-12-159.pek2.redhat.com [10.72.12.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71A555C28E;
 Thu, 20 Feb 2020 05:40:54 +0000 (UTC)
Subject: Re: [PATCH V3 4/5] virtio: introduce a vDPA based transport
To: Randy Dunlap <rdunlap@infradead.org>, mst@redhat.com,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
References: <20200220035650.7986-1-jasowang@redhat.com>
 <20200220035650.7986-5-jasowang@redhat.com>
 <2c5a3a84-be56-3003-8d71-d46645664bab@infradead.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0f796bc9-3e27-38ae-9d7a-bf2be2a9f8ab@redhat.com>
Date: Thu, 20 Feb 2020 13:40:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2c5a3a84-be56-3003-8d71-d46645664bab@infradead.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: shahafs@mellanox.com, jiri@mellanox.com, lulu@redhat.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, haotian.wang@sifive.com,
 hch@infradead.org, eperezma@redhat.com, maxime.coquelin@redhat.com,
 jgg@mellanox.com, hanand@xilinx.com, parav@mellanox.com,
 zhihong.wang@intel.com, lingshan.zhu@intel.com, mhabets@solarflare.com,
 rob.miller@broadcom.com
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

Ck9uIDIwMjAvMi8yMCDkuIvljYgxMjowNywgUmFuZHkgRHVubGFwIHdyb3RlOgo+IE9uIDIvMTkv
MjAgNzo1NiBQTSwgSmFzb24gV2FuZyB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmly
dGlvL0tjb25maWcgYi9kcml2ZXJzL3ZpcnRpby9LY29uZmlnCj4+IGluZGV4IDljNGZkYjY0ZDlh
Yy4uMGRmMzY3NmIwZjRmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3ZpcnRpby9LY29uZmlnCj4+
ICsrKyBiL2RyaXZlcnMvdmlydGlvL0tjb25maWcKPj4gQEAgLTQzLDYgKzQzLDE5IEBAIGNvbmZp
ZyBWSVJUSU9fUENJX0xFR0FDWQo+PiAgIAo+PiAgIAkgIElmIHVuc3VyZSwgc2F5IFkuCj4+ICAg
Cj4+ICtjb25maWcgVklSVElPX1ZEUEEKPj4gKwl0cmlzdGF0ZSAidkRQQSBkcml2ZXIgZm9yIHZp
cnRpbyBkZXZpY2VzIgo+PiArICAgICAgICBzZWxlY3QgVkRQQQo+PiArICAgICAgICBzZWxlY3Qg
VklSVElPCj4+ICsJaGVscAo+PiArCSAgVGhpcyBkcml2ZXIgcHJvdmlkZXMgc3VwcG9ydCBmb3Ig
dmlydGlvIGJhc2VkIHBhcmF2aXJ0dWFsCj4+ICsJICBkZXZpY2UgZHJpdmVyIG92ZXIgdkRQQSBi
dXMuIEZvciB0aGlzIHRvIGJlIHVzZWZ1bCwgeW91IG5lZWQKPj4gKwkgIGFuIGFwcHJvcHJpYXRl
IHZEUEEgZGV2aWNlIGltcGxlbWVudGF0aW9uIHRoYXQgb3BlcmF0ZXMgb24gYQo+PiArICAgICAg
ICAgIHBoeXNpY2FsIGRldmljZSB0byBhbGxvdyB0aGUgZGF0YXBhdGggb2YgdmlydGlvIHRvIGJl
Cj4+ICsJICBvZmZsb2FkZWQgdG8gaGFyZHdhcmUuCj4+ICsKPj4gKwkgIElmIHVuc3VyZSwgc2F5
IE0uCj4+ICsKPiBQbGVhc2UgdXNlIHRhYnMgY29uc2lzdGVudGx5IGZvciBpbmRlbnRhdGlvbiwg
bm90IHNwYWNlcywKPiBleGNlcHQgaW4gdGhlIEtjb25maWcgaGVscCB0ZXh0LCB3aGljaCBzaG91
bGQgYmUgMSB0YWIgKyAyIHNwYWNlcy4KCgpGaXhlZC4KClRoYW5rcwoKCj4KPj4gICBjb25maWcg
VklSVElPX1BNRU0KPj4gICAJdHJpc3RhdGUgIlN1cHBvcnQgZm9yIHZpcnRpbyBwbWVtIGRyaXZl
ciIKPj4gICAJZGVwZW5kcyBvbiBWSVJUSU8KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
