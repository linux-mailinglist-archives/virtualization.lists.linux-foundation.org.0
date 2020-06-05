Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFE11EF510
	for <lists.virtualization@lfdr.de>; Fri,  5 Jun 2020 12:11:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7A5A4889AF;
	Fri,  5 Jun 2020 10:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zr4rwPZlyY5U; Fri,  5 Jun 2020 10:11:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9CAD8888C4;
	Fri,  5 Jun 2020 10:11:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7476FC016E;
	Fri,  5 Jun 2020 10:11:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFA2DC016E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 10:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9D7718702C
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 10:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QZPApnN8SpyX
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 10:11:21 +0000 (UTC)
X-Greylist: delayed 00:05:04 by SQLgrey-1.7.6
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C35B08626B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 10:11:20 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=alex.shi@linux.alibaba.com;
 NM=1; PH=DS; RN=39; SR=0; TI=SMTPD_---0U-djnUn_1591351570; 
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com
 fp:SMTPD_---0U-djnUn_1591351570) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 05 Jun 2020 18:06:11 +0800
Subject: Re: [PATCH RFC v4 00/13] virtio-mem: paravirtualized memory
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20191212171137.13872-1-david@redhat.com>
 <9acc5d04-c8e9-ef53-85e4-709030997ca6@redhat.com>
 <1cfa9edb-47ea-1495-4e28-4cf391eab44c@linux.alibaba.com>
 <d6cd1870-1012-cb3d-7d29-8e5ad2703717@redhat.com>
From: Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <fe476535-3e98-0682-559c-73adde22e7ab@linux.alibaba.com>
Date: Fri, 5 Jun 2020 18:06:10 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d6cd1870-1012-cb3d-7d29-8e5ad2703717@redhat.com>
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

CgrlnKggMjAyMC82LzUg5LiL5Y2INTowOCwgRGF2aWQgSGlsZGVuYnJhbmQg5YaZ6YGTOgo+IFBs
ZWFzZSB1c2UgdGhlIHZpcnRpby1tZW0tdjQgYnJhbmNoIGZvciBub3csIHY1IGlzIHN0aWxsIHVu
ZGVyCj4gY29uc3RydWN0aW9uIChhbmQgbWlnaHQgYmUgc2NyYXBwZWQgY29tcGxldGVseSBpZiB2
NCBnb2VzIHVwc3RyZWFtIGFzIGlzKS4KPiAKPiBMb29rcyBsaWtlIGEgRE1BIGlzc3VlLiBZb3Vy
J3JlIGhvdHBsdWdnaW5nIDFHQiwgd2hpY2ggc2hvdWxkIG5vdCByZWFsbHkKPiBlYXQgdG9vIG11
Y2ggbWVtb3J5LiBUaGVyZSB3YXMgYSBzaW1pbGFyIGlzc3VlIHJlcG9ydGVkIGJ5IEh1aSBpbiBb
MV0sCj4gd2hpY2ggYm9pbGVkIGRvd24gdG8gd3JvbmcgdXNhZ2Ugb2YgdGhlIHN3aW90bGIgcGFy
YW1ldGVyLgoKSSBoYXZlIG5vIHN3aW90Ymw9bm9mb3JjZSBzZXQsIGFuZCBzb21ldGltZSBubyBz
d2lvdGxiIGVycm9yIHJlcG9ydGVkLCBsaWtlCihxZW11KSBbICAgNDEuNTkxMzA4XSBlMTAwMCAw
MDAwOjAwOjAzLjA6IGRtYV9kaXJlY3RfbWFwX3BhZ2U6IG92ZXJmbG93IDB4MDAwMDAwMDExZmQ0
NzBkYSs1NCBvZiBkZXZpY2UgbWFzayBmZmZmZmZmZgpbICAgNDEuNTkyNDMxXSBlMTAwMCAwMDAw
OjAwOjAzLjA6IFRYIERNQSBtYXAgZmFpbGVkClsgICA0MS41OTMwMzFdIGUxMDAwIDAwMDA6MDA6
MDMuMDogZG1hX2RpcmVjdF9tYXBfcGFnZTogb3ZlcmZsb3cgMHgwMDAwMDAwMTFmZDQ3NGRhKzU0
IG9mIGRldmljZSBtYXNrIGZmZmZmZgouLi4KWyAgIDYzLjA0OTQ2NF0gYXRhX3BpaXggMDAwMDow
MDowMS4xOiBkbWFfZGlyZWN0X21hcF9zZzogb3ZlcmZsb3cgMHgwMDAwMDAwMTA3ZGIyMDAwKzQw
OTYgb2YgZGV2aWNlIG1hc2sgZmZmZmZmZmYKWyAgIDYzLjA2ODI5N10gYXRhMS4wMDogZXhjZXB0
aW9uIEVtYXNrIDB4MCBTQWN0IDB4MCBTRXJyIDB4MCBhY3Rpb24gMHgwClsgICA2My4wNjkwNTdd
IGF0YTEuMDA6IGZhaWxlZCBjb21tYW5kOiBSRUFEIERNQQpbICAgNjMuMDY5NTgwXSBhdGExLjAw
OiBjbWQgYzgvMDA6MjA6NDA6YmQ6ZDIvMDA6MDA6MDA6MDA6MDAvZTAgdGFnIDAgZG1hIDE2Mzg0
IGluClsgICA2My4wNjk1ODBdICAgICAgICAgIHJlcyA1MC8wMDowMDozZjozMDo4MC8wMDowMDow
MDowMDowMC9hMCBFbWFzayAweDQwIChpbnRlcm5hbCBlcnJvcikgCj4gCj4gSW4gc3VjaCBjYXNl
cyB5b3Ugc2hvdWxkIGFsd2F5cyB0cnkgdG8gcmVwcm9kdWNlIHdpdGggaG90cGx1ZyBvZiBhCj4g
c2FtLXNpemVkIERJTU0uIEUuZy4sIGhvdHBsdWdnaW5nIGEgMUdCIERJTU0gc2hvdWxkIHJlc3Vs
dCBpbiB0aGUgc2FtZQo+IGlzc3VlLgo+IAo+IFdoYXQgZG9lcyB5b3VyIC5jb25maWcgc3BlY2lm
eSBmb3IgQ09ORklHX01FTU9SWV9IT1RQTFVHX0RFRkFVTFRfT05MSU5FPwoKWWVzLCBpdCdzIHNl
dC4gCgpJIGhhZCB0cmllZCB0aGUgdjIvdjQgdmVyc2lvbiwgd2hpY2ggaGFzIHRoZSBzYW1lIGlz
c3VlLgpJcyB0aGlzIHJlbGF0ZWQgd2l0aCB2aXJ0aW8tbWVtIHN0YXJ0IGFkZHJlc3MgdG9vIGxv
dz8KClRoYW5rcyBhIGxvdCEKPiAKPiBJJ2xsIHRyeSB0byByZXByb2R1Y2Ugd2l0aCB2NCBicmll
Zmx5Lgo+IAo+IFsxXQo+IGh0dHBzOi8vbGttbC5rZXJuZWwub3JnL3IvOTcwOEY0M0EtOUJEMi00
Mzc3LThFRTgtN0ZCMUQ5NUM2RjY5QGxpbnV4LmFsaWJhYmEuY29tCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
