Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A1719AE0A
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 16:36:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5A63D88684;
	Wed,  1 Apr 2020 14:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 502WolWOPFNn; Wed,  1 Apr 2020 14:36:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C8B578867D;
	Wed,  1 Apr 2020 14:36:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4418C089F;
	Wed,  1 Apr 2020 14:36:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33E7EC089F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2F7B486AFE
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H92IxV15dmrX
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:36:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 73EE786AF2
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585751793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r3kMlhd9LGGbDeZac0FUzE3oyqJ5Q+lDzgiNb4487e4=;
 b=aVdU0s6+yI1FIxU3W2Zbje02/QO9svuagkd65G3ndwaVqikluu5Le3Ax1ScjaBj0UtuEF6
 gSpefZhZgNRnJ4X63EJygGcek+hzmKNWqHruFySgbC9lztB57iGVQIVlpY2WUsIeV/07zL
 vmSX/wXwhhHeSB8XmlIyIyeOc33K/A8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-frmlcPUUObukrR01-oFmKg-1; Wed, 01 Apr 2020 10:36:31 -0400
X-MC-Unique: frmlcPUUObukrR01-oFmKg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E2D9107ACC7;
 Wed,  1 Apr 2020 14:36:28 +0000 (UTC)
Received: from [10.72.12.139] (ovpn-12-139.pek2.redhat.com [10.72.12.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B6EC5E000;
 Wed,  1 Apr 2020 14:36:09 +0000 (UTC)
Subject: Re: [PATCH V9 1/9] vhost: refine vhost and vringh kconfig
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-2-jasowang@redhat.com>
 <fde312a4-56bd-f11f-799f-8aa952008012@de.ibm.com>
 <41ee1f6a-3124-d44b-bf34-0f26604f9514@redhat.com>
 <4726da4c-11ec-3b6e-1218-6d6d365d5038@de.ibm.com>
 <39b96e3a-9f4e-6e1d-e988-8c4bcfb55879@de.ibm.com>
 <c423c5b1-7817-7417-d7af-e07bef6368e7@redhat.com>
 <20200401101634-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <45fbf320-90e5-9eed-6f07-c5a4dd2ca8f5@redhat.com>
Date: Wed, 1 Apr 2020 22:36:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200401101634-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: kvm@vger.kernel.org, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, hanand@xilinx.com,
 hch@infradead.org, eperezma@redhat.com, jgg@mellanox.com, shahafs@mellanox.com,
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

Ck9uIDIwMjAvNC8xIOS4i+WNiDEwOjE4LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
V2VkLCBBcHIgMDEsIDIwMjAgYXQgMTA6MTM6MjlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAyMC80LzEg5LiL5Y2IOTowMiwgQ2hyaXN0aWFuIEJvcm50cmFlZ2VyIHdyb3RlOgo+
Pj4gT24gMDEuMDQuMjAgMTQ6NTYsIENocmlzdGlhbiBCb3JudHJhZWdlciB3cm90ZToKPj4+PiBP
biAwMS4wNC4yMCAxNDo1MCwgSmFzb24gV2FuZyB3cm90ZToKPj4+Pj4gT24gMjAyMC80LzEg5LiL
5Y2INzoyMSwgQ2hyaXN0aWFuIEJvcm50cmFlZ2VyIHdyb3RlOgo+Pj4+Pj4gT24gMjYuMDMuMjAg
MTU6MDEsIEphc29uIFdhbmcgd3JvdGU6Cj4+Pj4+Pj4gQ3VycmVudGx5LCBDT05GSUdfVkhPU1Qg
ZGVwZW5kcyBvbiBDT05GSUdfVklSVFVBTElaQVRJT04uIEJ1dCB2aG9zdCBpcwo+Pj4+Pj4+IG5v
dCBuZWNlc3NhcmlseSBmb3IgVk0gc2luY2UgaXQncyBhIGdlbmVyaWMgdXNlcnNwYWNlIGFuZCBr
ZXJuZWwKPj4+Pj4+PiBjb21tdW5pY2F0aW9uIHByb3RvY29sLiBTdWNoIGRlcGVuZGVuY3kgbWF5
IHByZXZlbnQgYXJjaHMgd2l0aG91dAo+Pj4+Pj4+IHZpcnR1YWxpemF0aW9uIHN1cHBvcnQgZnJv
bSB1c2luZyB2aG9zdC4KPj4+Pj4+Pgo+Pj4+Pj4+IFRvIHNvbHZlIHRoaXMsIGEgZGVkaWNhdGVk
IHZob3N0IG1lbnUgaXMgY3JlYXRlZCB1bmRlciBkcml2ZXJzIHNvCj4+Pj4+Pj4gQ09OSUZHX1ZI
T1NUIGNhbiBiZSBkZWNvdXBsZWQgb3V0IG9mIENPTkZJR19WSVJUVUFMSVpBVElPTi4KPj4+Pj4+
IEZXSVcsIHRoaXMgbm93IHJlc3VsdHMgaW4gdmhvc3Qgbm90IGJlaW5nIGJ1aWxkIHdpdGggZGVm
Y29uZmlnIGtlcm5lbHMgKGluIHRvZGF5cwo+Pj4+Pj4gbGludXgtbmV4dCkuCj4+Pj4+Pgo+Pj4+
PiBIaSBDaHJpc3RpYW46Cj4+Pj4+Cj4+Pj4+IERpZCB5b3UgbWVldCBpdCBldmVuIHdpdGggdGhp
cyBjb21taXRodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9u
ZXh0L2xpbnV4LW5leHQuZ2l0L2NvbW1pdC8/aWQ9YTRiZTQwY2JjZWRiYTliNWI3MTRmM2M5NTE4
MmU4YTQ1MTc2ZTQyZD8KPj4+PiBJIHNpbXBseSB1c2VkIGxpbnV4LW5leHQuIFRoZSBkZWZjb25m
aWcgZG9lcyBOT1QgY29udGFpbiBDT05GSUdfVkhPU1QgYW5kIHRoZXJlZm9yZSBDT05GSUdfVkhP
U1RfTkVUIGFuZCBmcmllbmRzCj4+Pj4gY2FuIG5vdCBiZSBzZWxlY3RlZC4KPj4+Pgo+Pj4+ICQg
Z2l0IGNoZWNrb3V0IG5leHQtMjAyMDA0MDEKPj4+PiAkIG1ha2UgZGVmY29uZmlnCj4+Pj4gICAg
IEhPU1RDQyAgc2NyaXB0cy9iYXNpYy9maXhkZXAKPj4+PiAgICAgSE9TVENDICBzY3JpcHRzL2tj
b25maWcvY29uZi5vCj4+Pj4gICAgIEhPU1RDQyAgc2NyaXB0cy9rY29uZmlnL2NvbmZkYXRhLm8K
Pj4+PiAgICAgSE9TVENDICBzY3JpcHRzL2tjb25maWcvZXhwci5vCj4+Pj4gICAgIExFWCAgICAg
c2NyaXB0cy9rY29uZmlnL2xleGVyLmxleC5jCj4+Pj4gICAgIFlBQ0MgICAgc2NyaXB0cy9rY29u
ZmlnL3BhcnNlci50YWIuW2NoXQo+Pj4+ICAgICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZpZy9sZXhl
ci5sZXgubwo+Pj4+ICAgICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZpZy9wYXJzZXIudGFiLm8KPj4+
PiAgICAgSE9TVENDICBzY3JpcHRzL2tjb25maWcvcHJlcHJvY2Vzcy5vCj4+Pj4gICAgIEhPU1RD
QyAgc2NyaXB0cy9rY29uZmlnL3N5bWJvbC5vCj4+Pj4gICAgIEhPU1RDQyAgc2NyaXB0cy9rY29u
ZmlnL3V0aWwubwo+Pj4+ICAgICBIT1NUTEQgIHNjcmlwdHMva2NvbmZpZy9jb25mCj4+Pj4gKioq
IERlZmF1bHQgY29uZmlndXJhdGlvbiBpcyBiYXNlZCBvbiAneDg2XzY0X2RlZmNvbmZpZycKPj4+
PiAjCj4+Pj4gIyBjb25maWd1cmF0aW9uIHdyaXR0ZW4gdG8gLmNvbmZpZwo+Pj4+ICMKPj4+Pgo+
Pj4+ICQgZ3JlcCBWSE9TVCAuY29uZmlnCj4+Pj4gIyBDT05GSUdfVkhPU1QgaXMgbm90IHNldAo+
Pj4+Cj4+Pj4+IElmIHllcywgd2hhdCdzIHlvdXIgYnVpbGQgY29uZmlnIGxvb2tzIGxpa2U/Cj4+
Pj4+Cj4+Pj4+IFRoYW5rcwo+Pj4gVGhpcyB3YXMgeDg2LiBOb3Qgc3VyZSBpZiB0aGF0IGRpZCB3
b3JrIGJlZm9yZS4KPj4+IE9uIHMzOTAgdGhpcyBpcyBkZWZpbml0ZWx5IGEgcmVncmVzc2lvbiBh
cyB0aGUgZGVmY29uZmlnIGZpbGVzCj4+PiBmb3IgczM5MCBkbyBzZWxlY3QgVkhPU1RfTkVUCj4+
Pgo+Pj4gZ3JlcCBWSE9TVCBhcmNoL3MzOTAvY29uZmlncy8qCj4+PiBhcmNoL3MzOTAvY29uZmln
cy9kZWJ1Z19kZWZjb25maWc6Q09ORklHX1ZIT1NUX05FVD1tCj4+PiBhcmNoL3MzOTAvY29uZmln
cy9kZWJ1Z19kZWZjb25maWc6Q09ORklHX1ZIT1NUX1ZTT0NLPW0KPj4+IGFyY2gvczM5MC9jb25m
aWdzL2RlZmNvbmZpZzpDT05GSUdfVkhPU1RfTkVUPW0KPj4+IGFyY2gvczM5MC9jb25maWdzL2Rl
ZmNvbmZpZzpDT05GSUdfVkhPU1RfVlNPQ0s9bQo+Pj4KPj4+IGFuZCB0aGlzIHdvcmtlZCB3aXRo
IDUuNiwgYnV0IGRvZXMgbm90IHdvcmsgd2l0aCBuZXh0LiBKdXN0IGFkZGluZwo+Pj4gQ09ORklH
X1ZIT1NUPW0gdG8gdGhlIGRlZmNvbmZpZyBzb2x2ZXMgdGhlIGlzc3VlLCBzb21ldGhpbmcgbGlr
ZQo+PiBSaWdodCwgSSB0aGluayB3ZSBwcm9iYWJseSBuZWVkCj4+Cj4+IDEpIGFkZCBDT05GSUdf
VkhPU1Q9bSB0byBhbGwgZGVmY29uZmlncyB0aGF0IGVuYWJsZXMKPj4gQ09ORklHX1ZIT1NUX05F
VC9WU09DSy9TQ1NJLgo+Pgo+PiBvcgo+Pgo+PiAyKSBkb24ndCB1c2UgbWVudWNvbmZpZyBmb3Ig
Q09ORklHX1ZIT1NULCBsZXQgTkVUL1NDU0kvVkRQQSBqdXN0IHNlbGVjdCBpdC4KPj4KPj4gVGhh
bmtzCj4gSSB0aGluayBJIHByZWZlciAyLCBidXQgZG9lcyBpdCBhdXRvLXNlbGVjdCBWSE9TVF9J
T1RMQiB0aGVuPwoKCkkgdGhpbmsgc28uIEUuZyBWSE9TVF9ORVQgd2lsbCBzZWxlY3QgVkhPU1Qs
wqAgYW5kIFZIT1NUIHdpbGwgc2VsZWN0IApWSE9TVF9JT1RMQi4KCgo+IEdlbmVyYWxseSB3aGF0
IHdhcyB0aGUgcmVhc29uIHRvIGRyb3Agc2VsZWN0IFZIT1NUIGZyb20gZGV2aWNlcz8KPgo+CgpU
aGUgcmVhc29uIGlzIGEgc3ViIG1lbnUgaXMgbmVlZGVkIGZvciBWSE9TVCBkZXZpY2VzLCB0aGVu
IEkgdXNlIAptZW51Y29uZmlnIGZvciBDT05GSUdfVkhPU1QuCgpUaGVuIHNlbGVjdCBpcyBub3Qg
bmVjZXNzYXJ5IGFueW1vcmUuCgpUaGFua3MKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
