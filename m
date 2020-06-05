Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E9B1EF37B
	for <lists.virtualization@lfdr.de>; Fri,  5 Jun 2020 10:55:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 68EDE88329;
	Fri,  5 Jun 2020 08:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 78IS7SiCvLKJ; Fri,  5 Jun 2020 08:55:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AFB0388324;
	Fri,  5 Jun 2020 08:55:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8585BC088D;
	Fri,  5 Jun 2020 08:55:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15476C016E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 08:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0BCD98743E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 08:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZbsDRGU3P4oU
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 08:55:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 552FC86CC0
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 08:55:25 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R381e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01422; MF=alex.shi@linux.alibaba.com;
 NM=1; PH=DS; RN=39; SR=0; TI=SMTPD_---0U-diTxY_1591347318; 
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com
 fp:SMTPD_---0U-diTxY_1591347318) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 05 Jun 2020 16:55:19 +0800
Subject: Re: [PATCH RFC v4 00/13] virtio-mem: paravirtualized memory
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20191212171137.13872-1-david@redhat.com>
 <9acc5d04-c8e9-ef53-85e4-709030997ca6@redhat.com>
From: Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <1cfa9edb-47ea-1495-4e28-4cf391eab44c@linux.alibaba.com>
Date: Fri, 5 Jun 2020 16:55:18 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9acc5d04-c8e9-ef53-85e4-709030997ca6@redhat.com>
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

CgrlnKggMjAyMC8xLzkg5LiL5Y2IOTo0OCwgRGF2aWQgSGlsZGVuYnJhbmQg5YaZ6YGTOgo+IFBp
bmcsCj4gCj4gSSdkIGxvdmUgdG8gZ2V0IHNvbWUgZmVlZGJhY2sgb24KPiAKPiBhKSBUaGUgcmVt
YWluaW5nIE1NIGJpdHMgZnJvbSBNTSBmb2xrcyAoZXNwZWNpYWxseSwgcGF0Y2ggIzYgYW5kICM4
KS4KPiBiKSBUaGUgZ2VuZXJhbCB2aXJ0aW8gaW5mcmFzdHJ1Y3R1cmUgKGVzcC4gdWFwaSBpbiBw
YXRjaCAjMikgZnJvbSB2aXJ0aW8KPiBmb2xrcy4KPiAKPiBJJ20gcGxhbm5pbmcgdG8gc2VuZCBh
IHByb3BlciB2MSAoIVJGQykgb25jZSBJIGhhdmUgYWxsIG5lY2Vzc2FyeSBNTQo+IGFja3MuIElu
IHRoZSBtZWFud2hpbGUsIEkgd2lsbCBkbyBtb3JlIHRlc3RpbmcgYW5kIG1pbm9yIHJld29ya3Mg
KGUuZy4sCj4gZml4ICFDT05GSUdfTlVNQSBjb21waWxhdGlvbikuCgoKSGkgRGF2aWQsCgpUaGFu
a3MgZm9yIHlvdXIgd29yayEKCkkgYW0gdHJ5aW5nIHlvdXIgaHR0cHM6Ly9naXRodWIuY29tL2Rh
dmlkaGlsZGVuYnJhbmQvbGludXguZ2l0IHZpcnRpby1tZW0tdjUKd2hpY2ggd29ya3MgZmluZSBm
b3IgbWUsIGJ1dCBqdXN0IGEgJ0RNQSBlcnJvcicgaGFwcGVucyB3aGVuIGEgdm0gc3RhcnQgd2l0
aApsZXNzIHRoYW4gMkdCIG1lbW9yeSwgRG8gSSBtaXNzZWQgc3RoPwoKVGhhbmtzCkFsZXgKCgoo
cWVtdSkgcW9tLXNldCB2bTAgcmVxdWVzdGVkLXNpemUgMWcKKHFlbXUpIFsgICAyNi41NjAwMjZd
IHZpcnRpb19tZW0gdmlydGlvMDogcGx1Z2dlZCBzaXplOiAweDAKWyAgIDI2LjU2MDY0OF0gdmly
dGlvX21lbSB2aXJ0aW8wOiByZXF1ZXN0ZWQgc2l6ZTogMHg0MDAwMDAwMApbICAgMjYuNTYxNzMw
XSBzeXN0ZW1kLWpvdXJuYWxkWzE2N106IG5vIGRiIGZpbGUgdG8gcmVhZCAvcnVuL3VkZXYvZGF0
YS8rdmlydGlvOnZpcnRpbzA6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKWyAgIDI2LjU2MzEz
OF0gc3lzdGVtZC1qb3VybmFsZFsxNjddOiBubyBkYiBmaWxlIHRvIHJlYWQgL3J1bi91ZGV2L2Rh
dGEvK3ZpcnRpbzp2aXJ0aW8wOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5ClsgICAyNi41Njkx
MjJdIEJ1aWx0IDEgem9uZWxpc3RzLCBtb2JpbGl0eSBncm91cGluZyBvbi4gIFRvdGFsIHBhZ2Vz
OiA1MTMxNDEKWyAgIDI2LjU3MDAzOV0gUG9saWN5IHpvbmU6IE5vcm1hbAoKKHFlbXUpIFsgICAz
Mi4xNzU4MzhdIGUxMDAwIDAwMDA6MDA6MDMuMDogc3dpb3RsYiBidWZmZXIgaXMgZnVsbCAoc3o6
IDgxIGJ5dGVzKSwgdG90YWwgMCAoc2xvdHMpLCB1c2VkIDAgKHNsb3RzKQpbICAgMzIuMTc2OTIy
XSBlMTAwMCAwMDAwOjAwOjAzLjA6IFRYIERNQSBtYXAgZmFpbGVkClsgICAzMi4xNzc0ODhdIGUx
MDAwIDAwMDA6MDA6MDMuMDogc3dpb3RsYiBidWZmZXIgaXMgZnVsbCAoc3o6IDgxIGJ5dGVzKSwg
dG90YWwgMCAoc2xvdHMpLCB1c2VkIDAgKHNsb3RzKQpbICAgMzIuMTc4NTM1XSBlMTAwMCAwMDAw
OjAwOjAzLjA6IFRYIERNQSBtYXAgZmFpbGVkCgpteSBxZW11IGNvbW1hbmQgaXMgbGlrZSB0aGlz
OgpxZW11LXN5c3RlbS14ODZfNjQgIC0tZW5hYmxlLWt2bSBcCgktbSAyRyxtYXhtZW09MTZHIC1r
ZXJuZWwgL3Jvb3QvbGludXgtbmV4dC8kMS9hcmNoL3g4Ni9ib290L2J6SW1hZ2UgXAoJLXNtcCA0
IFwKCS1hcHBlbmQgImVhcmx5cHJpbnRrPXR0eVMwIHJvb3Q9L2Rldi9zZGExIGNvbnNvbGU9dHR5
UzAgZGVidWcgcHNpPTEgbm9rYXNsciBpZ25vcmVfbG9nbGV2ZWwiIFwKCS1oZGEgL3Jvb3QvQ2Vu
dE9TLTcteDg2XzY0LUF6dXJlLTE3MDMucWNvdzIgXAoJLW5ldCB1c2VyLGhvc3Rmd2Q9dGNwOjoy
MjIyLToyMiAtbmV0IG5pYyAtcyBcCiAgLW9iamVjdCBtZW1vcnktYmFja2VuZC1yYW0saWQ9bWVt
MCxzaXplPTNHIFwKICAtZGV2aWNlIHZpcnRpby1tZW0tcGNpLGlkPXZtMCxtZW1kZXY9bWVtMCxu
b2RlPTAscmVxdWVzdGVkLXNpemU9ME0gXAoJLS1ub2dyYXBoaWMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
