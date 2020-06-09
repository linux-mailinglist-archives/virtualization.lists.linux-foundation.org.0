Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B01A1F327C
	for <lists.virtualization@lfdr.de>; Tue,  9 Jun 2020 05:06:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A300F86BBC;
	Tue,  9 Jun 2020 03:06:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WMaVvXouOoWZ; Tue,  9 Jun 2020 03:06:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E4BF686D52;
	Tue,  9 Jun 2020 03:06:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD90CC016F;
	Tue,  9 Jun 2020 03:06:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D124BC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 03:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AC54D22D55
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 03:06:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kh0aHXIkMl74
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 03:06:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 by silver.osuosl.org (Postfix) with ESMTPS id 2FC7C227CC
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 03:06:18 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R781e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e07425; MF=alex.shi@linux.alibaba.com;
 NM=1; PH=DS; RN=39; SR=0; TI=SMTPD_---0U.29n7._1591671962; 
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com
 fp:SMTPD_---0U.29n7._1591671962) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 09 Jun 2020 11:06:03 +0800
Subject: Re: [PATCH RFC v4 00/13] virtio-mem: paravirtualized memory
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20191212171137.13872-1-david@redhat.com>
 <9acc5d04-c8e9-ef53-85e4-709030997ca6@redhat.com>
 <1cfa9edb-47ea-1495-4e28-4cf391eab44c@linux.alibaba.com>
 <d6cd1870-1012-cb3d-7d29-8e5ad2703717@redhat.com>
 <6b4724bf-84b5-9880-5464-1908425d106d@redhat.com>
 <e1643897-ebd7-75f8-d271-44f62318aa66@redhat.com>
 <95c6ef21-23e0-c768-999d-3af7f69d02d3@linux.alibaba.com>
 <b41dcc92-604e-0c48-92e5-5cb3d78f189e@redhat.com>
From: Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <acf6c8d5-9672-7ec8-f565-707aaaff8e48@linux.alibaba.com>
Date: Tue, 9 Jun 2020 11:05:50 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b41dcc92-604e-0c48-92e5-5cb3d78f189e@redhat.com>
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

CgrlnKggMjAyMC82LzUg5LiL5Y2IODoxOCwgRGF2aWQgSGlsZGVuYnJhbmQg5YaZ6YGTOgo+IE9u
IDA1LjA2LjIwIDEyOjQ2LCBBbGV4IFNoaSB3cm90ZToKPj4KPj4KPj4g5ZyoIDIwMjAvNi81IOS4
i+WNiDY6MDUsIERhdmlkIEhpbGRlbmJyYW5kIOWGmemBkzoKPj4+PiBJIGd1ZXNzIEkga25vdyB3
aGF0J3MgaGFwcGVuaW5nIGhlcmUuIEluIGNhc2Ugd2Ugb25seSBoYXZlIERNQSBtZW1vcnkKPj4+
PiB3aGVuIGJvb3RpbmcsIHdlIGRvbid0IHJlc2VydmUgc3dpb3RsYiBidWZmZXJzLiBPbmNlIHdl
IGhvdHBsdWcgbWVtb3J5Cj4+Pj4gYW5kIG9ubGluZSBaT05FX05PUk1BTCwgd2UgZG9uJ3QgaGF2
ZSBhbnkgc3dpb3RsYiBETUEgYm91bmNlIGJ1ZmZlcnMgdG8KPj4+PiBtYXAgc3VjaCBQRk5zICh0
b3RhbCAwIChzbG90cyksIHVzZWQgMCAoc2xvdHMpKS4KPj4+Pgo+Pj4+IENhbiB5b3UgdHJ5IHdp
dGggInN3aW90bGI9Zm9yY2UiIG9uIHRoZSBrZXJuZWwgY21kbGluZT8KPj4+IEFsdGVybmF0aXZl
LCBsb29rcyBsaWtlIHlvdSBjYW4gc3BlY2lmeSAiLW0gMkcsbWF4bWVtPTE2RyxzbG90cz0xIiwg
dG8KPj4+IGNyZWF0ZSBwcm9wZXIgQUNQSSB0YWJsZXMgdGhhdCBpbmRpY2F0ZSBob3RwbHVnZ2Fi
bGUgbWVtb3J5LiAoSSdsbCBoYXZlCj4+PiB0byBsb29rIGludG8gUUVNVSB0byBmaWd1cmUgb3V0
IHRvIGFsd2F5cyBpbmRpY2F0ZSBob3RwbHVnZ2FibGUgbWVtb3J5Cj4+PiB0aGF0IHdheSkuCj4+
Pgo+Pgo+Pgo+PiBUaGF0IHdvcmtzIHRvby4gWWVzLCBiZXR0ZXIgcmVzb2x2ZWQgaW4gcWVtdSwg
bWF5YmUuIDopCj4+Cj4gCj4gWW91IGNhbiBjaGVja291dAo+IAo+IGdpdEBnaXRodWIuY29tOmRh
dmlkaGlsZGVuYnJhbmQvcWVtdS5naXQgdmlydGlvLW1lbS12NAoKeWVzLCBpdCB3b3JrcyBmb3Ig
bWUuIFRoYW5rcyEKCj4gCj4gKHByb25lIHRvIGNoYW5nZSBiZWZvcmUgb2ZmaWNpYWxseSBzZW50
KSwgd2hpY2ggd2lsbCBjcmVhdGUgc3JhdCB0YWJsZXMKPiBhbHNvIGlmIG5vICJzbG90cyIgcGFy
YW1ldGVyIHdhcyBkZWZpbmVkIChhbmQgbm8gLW51bWEgY29uZmlnIHdhcwo+IHNwZWNpZmllZCku
Cj4gCj4gWW91ciBvcmlnaW5hbCBleGFtcGxlIHNob3VsZCB3b3JrIHdpdGggdGhhdC4KPiAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
