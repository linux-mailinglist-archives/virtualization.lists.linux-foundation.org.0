Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B92A16571B
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 06:42:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BF0EE84789;
	Thu, 20 Feb 2020 05:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WlMf-2Qo43bq; Thu, 20 Feb 2020 05:42:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2D4AB848F5;
	Thu, 20 Feb 2020 05:42:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18C28C1D81;
	Thu, 20 Feb 2020 05:42:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 823B7C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 05:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 70EDB82226
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 05:41:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AtOjqQg55o90
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 05:41:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8DFA0821E2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 05:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582177317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dk7nO3eus3Qsrx672fVvPd5BCNrZvdvTd4N3N3NS2ik=;
 b=Zr5ZpqkRRPlCOTbWehuol8bVKlpfMKVIai9PaafJuJGECJ9cIqfhzOXbuQx0hpzmP7ZjFu
 OrwsGDZIJlVu+Qp2U0vClkobtWCF+vIuf//jJiX0HENc1VrRXtwlqE02PTNLTxsQFjBBzc
 9VNzOo5CkFlQu8L/VLl5vJBbaQcAsuo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-j24KzrmjOpmMROsYrT9cjA-1; Thu, 20 Feb 2020 00:41:55 -0500
X-MC-Unique: j24KzrmjOpmMROsYrT9cjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAF7E18A6EC1;
 Thu, 20 Feb 2020 05:41:52 +0000 (UTC)
Received: from [10.72.12.159] (ovpn-12-159.pek2.redhat.com [10.72.12.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3789D1001B28;
 Thu, 20 Feb 2020 05:41:30 +0000 (UTC)
Subject: Re: [PATCH V3 5/5] vdpasim: vDPA device simulator
To: Randy Dunlap <rdunlap@infradead.org>, mst@redhat.com,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
References: <20200220035650.7986-1-jasowang@redhat.com>
 <20200220035650.7986-6-jasowang@redhat.com>
 <ee917060-da84-e94d-df99-208100345b14@infradead.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c1d82c5c-11f8-1bfc-ecc9-71093d0bec91@redhat.com>
Date: Thu, 20 Feb 2020 13:41:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ee917060-da84-e94d-df99-208100345b14@infradead.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Ck9uIDIwMjAvMi8yMCDkuIvljYgxMjowOSwgUmFuZHkgRHVubGFwIHdyb3RlOgo+IE9uIDIvMTkv
MjAgNzo1NiBQTSwgSmFzb24gV2FuZyB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmly
dGlvL3ZkcGEvS2NvbmZpZyBiL2RyaXZlcnMvdmlydGlvL3ZkcGEvS2NvbmZpZwo+PiBpbmRleCA3
YTk5MTcwZTZjMzAuLmUzNjU2YjcyMjY1NCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy92aXJ0aW8v
dmRwYS9LY29uZmlnCj4+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3ZkcGEvS2NvbmZpZwo+PiBAQCAt
NywzICs3LDIxIEBAIGNvbmZpZyBWRFBBCj4+ICAgICAgICAgICAgIGRhdGFwYXRoIHdoaWNoIGNv
bXBsaWVzIHdpdGggdmlydGlvIHNwZWNpZmljYXRpb25zIHdpdGgKPj4gICAgICAgICAgICAgdmVu
ZG9yIHNwZWNpZmljIGNvbnRyb2wgcGF0aC4KPj4gICAKPj4gK21lbnVjb25maWcgVkRQQV9NRU5V
Cj4+ICsJYm9vbCAiVkRQQSBkcml2ZXJzIgo+PiArCWRlZmF1bHQgbgo+PiArCj4+ICtpZiBWRFBB
X01FTlUKPj4gKwo+PiArY29uZmlnIFZEUEFfU0lNCj4+ICsJdHJpc3RhdGUgInZEUEEgZGV2aWNl
IHNpbXVsYXRvciIKPj4gKyAgICAgICAgc2VsZWN0IFZEUEEKPj4gKyAgICAgICAgZGVwZW5kcyBv
biBSVU5USU1FX1RFU1RJTkdfTUVOVQo+PiArICAgICAgICBkZWZhdWx0IG4KPj4gKyAgICAgICAg
aGVscAo+PiArICAgICAgICAgIHZEUEEgbmV0d29ya2luZyBkZXZpY2Ugc2ltdWxhdG9yIHdoaWNo
IGxvb3AgVFggdHJhZmZpYyBiYWNrCj4+ICsgICAgICAgICAgdG8gUlguIFRoaXMgZGV2aWNlIGlz
IHVzZWQgZm9yIHRlc3RpbmcsIHByb3RvdHlwaW5nIGFuZAo+PiArICAgICAgICAgIGRldmVsb3Bt
ZW50IG9mIHZEUEEuCj4+ICsKPj4gK2VuZGlmICMgVkRQQV9NRU5VCj4+ICsKPiBVc2UgMSB0YWIg
Zm9yIGluZGVudGF0aW9uIGZvciB0cmlzdGF0ZS9zZWxlY3QvZGVwZW5kcy9kZWZhdWx0L2hlbHAs
Cj4gYW5kIHRoZW4gMSB0YWIgKyAyIHNwYWNlcyBmb3IgaGVscCB0ZXh0LgoKClllcy4KClRoYW5r
cwoKCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
