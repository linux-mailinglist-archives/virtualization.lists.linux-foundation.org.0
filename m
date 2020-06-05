Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE2E1EF501
	for <lists.virtualization@lfdr.de>; Fri,  5 Jun 2020 12:09:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3F95B8823F;
	Fri,  5 Jun 2020 10:09:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UbyHeFaGBl6W; Fri,  5 Jun 2020 10:09:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DC05188236;
	Fri,  5 Jun 2020 10:09:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C04BAC016E;
	Fri,  5 Jun 2020 10:09:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48548C016E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 10:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 271E9253F8
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 10:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 33FgTe02xhI7
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 10:09:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 by silver.osuosl.org (Postfix) with ESMTPS id 02AD8203AC
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 10:09:02 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R441e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01355; MF=alex.shi@linux.alibaba.com;
 NM=1; PH=DS; RN=39; SR=0; TI=SMTPD_---0U-dqblm_1591351735; 
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com
 fp:SMTPD_---0U-dqblm_1591351735) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 05 Jun 2020 18:08:56 +0800
Subject: Re: [PATCH RFC v4 00/13] virtio-mem: paravirtualized memory
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20191212171137.13872-1-david@redhat.com>
 <9acc5d04-c8e9-ef53-85e4-709030997ca6@redhat.com>
 <1cfa9edb-47ea-1495-4e28-4cf391eab44c@linux.alibaba.com>
 <d6cd1870-1012-cb3d-7d29-8e5ad2703717@redhat.com>
 <6b4724bf-84b5-9880-5464-1908425d106d@redhat.com>
From: Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <741e7d4b-4433-98fc-f849-cbb460d61a41@linux.alibaba.com>
Date: Fri, 5 Jun 2020 18:08:55 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6b4724bf-84b5-9880-5464-1908425d106d@redhat.com>
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

CgrlnKggMjAyMC82LzUg5LiL5Y2INTozNiwgRGF2aWQgSGlsZGVuYnJhbmQg5YaZ6YGTOgo+IEkg
Z3Vlc3MgSSBrbm93IHdoYXQncyBoYXBwZW5pbmcgaGVyZS4gSW4gY2FzZSB3ZSBvbmx5IGhhdmUg
RE1BIG1lbW9yeQo+IHdoZW4gYm9vdGluZywgd2UgZG9uJ3QgcmVzZXJ2ZSBzd2lvdGxiIGJ1ZmZl
cnMuIE9uY2Ugd2UgaG90cGx1ZyBtZW1vcnkKPiBhbmQgb25saW5lIFpPTkVfTk9STUFMLCB3ZSBk
b24ndCBoYXZlIGFueSBzd2lvdGxiIERNQSBib3VuY2UgYnVmZmVycyB0bwo+IG1hcCBzdWNoIFBG
TnMgKHRvdGFsIDAgKHNsb3RzKSwgdXNlZCAwIChzbG90cykpLgo+IAo+IENhbiB5b3UgdHJ5IHdp
dGggInN3aW90bGI9Zm9yY2UiIG9uIHRoZSBrZXJuZWwgY21kbGluZT8KClllcywgaXQgd29ya3Mg
ZmluZSB3aXRoIHRoaXMgY21kbGluZS4gcHJvYmxlbXMgZ29uZSwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
