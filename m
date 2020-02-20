Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 477BB16570F
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 06:40:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F334B8389C;
	Thu, 20 Feb 2020 05:40:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NHkSOqwhV0nu; Thu, 20 Feb 2020 05:40:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7359E84770;
	Thu, 20 Feb 2020 05:40:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D2C5C013E;
	Thu, 20 Feb 2020 05:40:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04626C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 05:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E775184F2B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 05:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z2rwWtvlVqm6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 05:40:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 729A784F24
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 05:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582177245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8QbhRAmcBDryazlqaGLXKsumEY3b7rJXFJ1OmDZwn+I=;
 b=LEBue4QREidX9/bpxSpjjjBAID9nHodLM37u6GjqWN8m3TJhn1T/uo6wbED9BnTnJM8B6N
 XJ9fyvnmzPV2VjfQjiCp22y4aB70cw1aUSna5+Jl3LCRS//+yALs/9pvN0wmp3aCLT/ADC
 rjArwzssY6iHSMSoVBHi5sUNtYe7U6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-X456oni2MnSlkHp90s63Aw-1; Thu, 20 Feb 2020 00:40:41 -0500
X-MC-Unique: X456oni2MnSlkHp90s63Aw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6797DB30;
 Thu, 20 Feb 2020 05:40:38 +0000 (UTC)
Received: from [10.72.12.159] (ovpn-12-159.pek2.redhat.com [10.72.12.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 347FB90774;
 Thu, 20 Feb 2020 05:40:17 +0000 (UTC)
Subject: Re: [PATCH V3 3/5] vDPA: introduce vDPA bus
To: Randy Dunlap <rdunlap@infradead.org>, mst@redhat.com,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
References: <20200220035650.7986-1-jasowang@redhat.com>
 <20200220035650.7986-4-jasowang@redhat.com>
 <0a74e918-3b89-2aaf-7855-02db629ce886@infradead.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <dab07484-9b31-1942-86bb-92ccf00dff11@redhat.com>
Date: Thu, 20 Feb 2020 13:40:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0a74e918-3b89-2aaf-7855-02db629ce886@infradead.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Ck9uIDIwMjAvMi8yMCDkuIvljYgxMjowNiwgUmFuZHkgRHVubGFwIHdyb3RlOgo+IE9uIDIvMTkv
MjAgNzo1NiBQTSwgSmFzb24gV2FuZyB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmly
dGlvL3ZkcGEvS2NvbmZpZyBiL2RyaXZlcnMvdmlydGlvL3ZkcGEvS2NvbmZpZwo+PiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjdhOTkxNzBlNmMzMAo+PiAtLS0g
L2Rldi9udWxsCj4+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3ZkcGEvS2NvbmZpZwo+PiBAQCAtMCww
ICsxLDkgQEAKPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+PiAr
Y29uZmlnIFZEUEEKPj4gKwl0cmlzdGF0ZQo+PiArICAgICAgICBkZWZhdWx0IG0KPiBEb24ndCBh
ZGQgZHJpdmVycyB0aGF0IGFyZSBlbmFibGVkIGJ5IGRlZmF1bHQsIHVubGVzcyB0aGV5IGFyZSBy
ZXF1aXJlZAo+IGZvciBhIHN5c3RlbSB0byBib290Lgo+Cj4gQW5kIGFueXRoaW5nIHRoYXQgd2Fu
dHMgVkRQQSBzaG91bGQganVzdCBzZWxlY3QgaXQsIHNvIHRoaXMgaXMgbm90IG5lZWRlZC4KCgpS
aWdodCBmaXhlZC4KClRoYW5rcwoKCj4KPj4gKyAgICAgICAgaGVscAo+PiArICAgICAgICAgIEVu
YWJsZSB0aGlzIG1vZHVsZSB0byBzdXBwb3J0IHZEUEEgZGV2aWNlIHRoYXQgdXNlcyBhCj4+ICsg
ICAgICAgICAgZGF0YXBhdGggd2hpY2ggY29tcGxpZXMgd2l0aCB2aXJ0aW8gc3BlY2lmaWNhdGlv
bnMgd2l0aAo+PiArICAgICAgICAgIHZlbmRvciBzcGVjaWZpYyBjb250cm9sIHBhdGguCj4+ICsK
PiB0aGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4v
bGlzdGluZm8vdmlydHVhbGl6YXRpb24=
