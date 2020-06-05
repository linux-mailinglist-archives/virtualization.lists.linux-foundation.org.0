Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B855F1EF59A
	for <lists.virtualization@lfdr.de>; Fri,  5 Jun 2020 12:46:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C548E86969;
	Fri,  5 Jun 2020 10:46:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LLPLGVRJEcFa; Fri,  5 Jun 2020 10:46:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 08E7A86948;
	Fri,  5 Jun 2020 10:46:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0144C016E;
	Fri,  5 Jun 2020 10:46:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3CA2C016E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 10:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B5C3D25316
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 10:46:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hDBiv0EstPqf
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 10:46:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 by silver.osuosl.org (Postfix) with ESMTPS id CBBD42514E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 10:46:33 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01f04397; MF=alex.shi@linux.alibaba.com;
 NM=1; PH=DS; RN=39; SR=0; TI=SMTPD_---0U-e32eJ_1591353986; 
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com
 fp:SMTPD_---0U-e32eJ_1591353986) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 05 Jun 2020 18:46:27 +0800
Subject: Re: [PATCH RFC v4 00/13] virtio-mem: paravirtualized memory
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20191212171137.13872-1-david@redhat.com>
 <9acc5d04-c8e9-ef53-85e4-709030997ca6@redhat.com>
 <1cfa9edb-47ea-1495-4e28-4cf391eab44c@linux.alibaba.com>
 <d6cd1870-1012-cb3d-7d29-8e5ad2703717@redhat.com>
 <6b4724bf-84b5-9880-5464-1908425d106d@redhat.com>
 <e1643897-ebd7-75f8-d271-44f62318aa66@redhat.com>
From: Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <95c6ef21-23e0-c768-999d-3af7f69d02d3@linux.alibaba.com>
Date: Fri, 5 Jun 2020 18:46:26 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e1643897-ebd7-75f8-d271-44f62318aa66@redhat.com>
Cc: Oscar Salvador <osalvador@suse.com>, Michal Hocko <mhocko@suse.com>,
 Robert Bradford <robert.bradford@intel.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Pingfan Liu <kernelfans@gmail.com>,
 Luiz Capitulino <lcapitulino@redhat.com>, linux-mm@kvack.org,
 Alexander Potapenko <glider@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 virtio-dev@lists.oasis-open.org, kvm@vger.kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Wei Yang <richard.weiyang@gmail.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Dave Young <dyoung@redhat.com>,
 Len Brown <lenb@kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Qian Cai <cai@lca.pw>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Samuel Ortiz <samuel.ortiz@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>,
 Juergen Gross <jgross@suse.com>, virtualization@lists.linux-foundation.org,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CgrlnKggMjAyMC82LzUg5LiL5Y2INjowNSwgRGF2aWQgSGlsZGVuYnJhbmQg5YaZ6YGTOgo+PiBJ
IGd1ZXNzIEkga25vdyB3aGF0J3MgaGFwcGVuaW5nIGhlcmUuIEluIGNhc2Ugd2Ugb25seSBoYXZl
IERNQSBtZW1vcnkKPj4gd2hlbiBib290aW5nLCB3ZSBkb24ndCByZXNlcnZlIHN3aW90bGIgYnVm
ZmVycy4gT25jZSB3ZSBob3RwbHVnIG1lbW9yeQo+PiBhbmQgb25saW5lIFpPTkVfTk9STUFMLCB3
ZSBkb24ndCBoYXZlIGFueSBzd2lvdGxiIERNQSBib3VuY2UgYnVmZmVycyB0bwo+PiBtYXAgc3Vj
aCBQRk5zICh0b3RhbCAwIChzbG90cyksIHVzZWQgMCAoc2xvdHMpKS4KPj4KPj4gQ2FuIHlvdSB0
cnkgd2l0aCAic3dpb3RsYj1mb3JjZSIgb24gdGhlIGtlcm5lbCBjbWRsaW5lPwo+IEFsdGVybmF0
aXZlLCBsb29rcyBsaWtlIHlvdSBjYW4gc3BlY2lmeSAiLW0gMkcsbWF4bWVtPTE2RyxzbG90cz0x
IiwgdG8KPiBjcmVhdGUgcHJvcGVyIEFDUEkgdGFibGVzIHRoYXQgaW5kaWNhdGUgaG90cGx1Z2dh
YmxlIG1lbW9yeS4gKEknbGwgaGF2ZQo+IHRvIGxvb2sgaW50byBRRU1VIHRvIGZpZ3VyZSBvdXQg
dG8gYWx3YXlzIGluZGljYXRlIGhvdHBsdWdnYWJsZSBtZW1vcnkKPiB0aGF0IHdheSkuCj4gCgoK
VGhhdCB3b3JrcyB0b28uIFllcywgYmV0dGVyIHJlc29sdmVkIGluIHFlbXUsIG1heWJlLiA6KQoK
VGhhbmtzIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpW
aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vdmlydHVhbGl6YXRpb24=
