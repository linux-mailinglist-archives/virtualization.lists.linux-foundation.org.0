Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B408329E5D1
	for <lists.virtualization@lfdr.de>; Thu, 29 Oct 2020 09:08:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3460285E7D;
	Thu, 29 Oct 2020 08:08:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CvMjZ-9ELAuJ; Thu, 29 Oct 2020 08:08:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 431B786227;
	Thu, 29 Oct 2020 08:08:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17CDBC0051;
	Thu, 29 Oct 2020 08:08:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D9B19C0051
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 08:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BFE0886227
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 08:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U8xADX_8HMEk
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 08:08:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E7E1C85E7D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 08:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603958917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7wgqGqZ0wLRZyTiOM1OAwQ0bdpUaIgkZ0lF5Q0v5yLw=;
 b=XTslYukul/IqAkXElJ5tgnMm3NIW6YvAXbRQkJieiddUtzike+zd1mllsBPZmgyXFlpAUW
 6kCwck629YeVafAaQy24CfhteONXCydp3rE6Emd4b2UcqQAT8ZOwsKlObVbDc5lDuCpd1a
 Bz1KctjLajEoBzh5Dd0U+SgIJqlkNXs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-Ofar--SsMjSfuShHFSIQOA-1; Thu, 29 Oct 2020 04:08:33 -0400
X-MC-Unique: Ofar--SsMjSfuShHFSIQOA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EAF8879528;
 Thu, 29 Oct 2020 08:08:32 +0000 (UTC)
Received: from [10.72.12.209] (ovpn-12-209.pek2.redhat.com [10.72.12.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53F7710013DB;
 Thu, 29 Oct 2020 08:08:27 +0000 (UTC)
Subject: Re: [PATCH] vhost: Use mutex to protect vq_irq setup
To: Eli Cohen <elic@nvidia.com>
References: <20201028142004.GA100353@mtl-vdi-166.wap.labs.mlnx>
 <60e24a0e-0d72-51b3-216a-b3cf62fb1a58@redhat.com>
 <20201029073717.GA132479@mtl-vdi-166.wap.labs.mlnx>
 <7b92d057-75cc-8bee-6354-2fbefcd1850a@redhat.com>
 <20201029075035.GC132479@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <34c4c6c0-ca95-6940-1b3f-c8c6a9cee833@redhat.com>
Date: Thu, 29 Oct 2020 16:08:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029075035.GC132479@mtl-vdi-166.wap.labs.mlnx>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: netdev <netdev@vger.kernel.org>, lingshan.zhu@intel.com,
 virtualization@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>
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

Ck9uIDIwMjAvMTAvMjkg5LiL5Y2IMzo1MCwgRWxpIENvaGVuIHdyb3RlOgo+IE9uIFRodSwgT2N0
IDI5LCAyMDIwIGF0IDAzOjM5OjI0UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+IE9uIDIw
MjAvMTAvMjkg5LiL5Y2IMzozNywgRWxpIENvaGVuIHdyb3RlOgo+Pj4gT24gVGh1LCBPY3QgMjks
IDIwMjAgYXQgMDM6MDM6MjRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+PiBPbiAyMDIw
LzEwLzI4IOS4i+WNiDEwOjIwLCBFbGkgQ29oZW4gd3JvdGU6Cj4+Pj4+IEJvdGggaXJxX2J5cGFz
c19yZWdpc3Rlcl9wcm9kdWNlcigpIGFuZCBpcnFfYnlwYXNzX3VucmVnaXN0ZXJfcHJvZHVjZXIo
KQo+Pj4+PiByZXF1aXJlIHByb2Nlc3MgY29udGV4dCB0byBydW4uIENoYW5nZSB0aGUgY2FsbCBj
b250ZXh0IGxvY2sgZnJvbQo+Pj4+PiBzcGlubG9jayB0byBtdXRleCB0byBwcm90ZWN0IHRoZSBz
ZXR1cCBwcm9jZXNzIHRvIGF2b2lkIGRlYWRsb2Nrcy4KPj4+Pj4KPj4+Pj4gRml4ZXM6IDI2NWEw
YWQ4NzMxZCAoInZob3N0OiBpbnRyb2R1Y2Ugdmhvc3RfdnJpbmdfY2FsbCIpCj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEVsaSBDb2hlbjxlbGljQG52aWRpYS5jb20+Cj4+Pj4gSGkgRWxpOgo+Pj4+Cj4+
Pj4gRHVyaW5nIHJldmlldyB3ZSBzcG90IHRoYXQgdGhlIHNwaW5sb2NrIGlzIG5vdCBuZWNlc3Nh
cnkuIEFuZCBpdCB3YXMgYWxyZWFkeQo+Pj4+IHByb3RlY3RlZCBieSB2cSBtdXRleC4gU28gaXQg
d2FzIHJlbW92ZWQgaW4gdGhpcyBjb21taXQ6Cj4+Pj4KPj4+PiBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9p
ZD04NmUxODJmZTEyZWU1ODY5MDIyNjE0NDU3MDM3MDk3YzcwZmUyZWQxCj4+Pj4KPj4+PiBUaGFu
a3MKPj4+Pgo+Pj4gSSBzZWUsIHRoYW5rcy4KPj4+Cj4+PiBCVFcsIHdoaWxlIHRlc3RpbmcgaXJx
IGJ5cGFzc2luZywgSSBub3RpY2VkIHRoYXQgcWVtdSBzdGFydGVkIGNyYXNoaW5nCj4+PiBhbmQg
SSBmYWlsIHRvIGJvb3QgdGhlIFZNPyBJcyB0aGF0IGEga25vd24gaXNzdWUuIEkgY2hlY2tlZCB1
c2luZwo+Pj4gdXBkYXRlZCBtYXN0ZXIgYnJhbmNoIG9mIHFlbXUgdXBkYXRlZCB5ZXN0ZXJkYXku
Cj4+IE5vdCBrbm93biB5ZXQuCj4+Cj4+Cj4+PiBBbnkgaWRlYXMgaG93IHRvIGNoZWNrIHRoaXMg
ZnVydGhlcj8KPj4gSSB3b3VsZCBiZSBoZWxwZnVsIGlmIHlvdSBjYW4gcGFzdGUgdGhlIGNhbGx0
cmFjZSBoZXJlLgo+Pgo+IEkgYW0gbm90IHRvbyBmYW1pbGlhciB3aXRoIHFlbXUuIEFzc3VtaW5n
IEkgYW0gdXNpbmcgdmlyc2ggc3RhcnQgdG8gYm9vdAo+IHRoZSBWTSwgaG93IGNhbiBJIGdldCB0
aGUgY2FsbCB0cmFjZT8KCgpZb3UgcHJvYmFibHkgbmVlZCB0byBjb25maWd1cmUgcWVtdSB3aXRo
IC0tZW5hYmxlLWRlYnVnLiBUaGVuIGFmdGVyIFZNIAppcyBsYXVuY2hpbmcsIHlvdSBjYW4gdXNl
IGdkYiB0byBhdHRhY2ggdG8gdGhlIHFlbXUgcHJvY2VzcywgdGhlbiBnZGIgCm1heSByZXBvcnQg
YSBjYWxsdHJhY2UgaWYgcWVtdSBjcmFzaGVzLgoKVGhhbmtzCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
