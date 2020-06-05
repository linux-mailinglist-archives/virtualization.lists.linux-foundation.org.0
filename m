Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F246F1EF4EE
	for <lists.virtualization@lfdr.de>; Fri,  5 Jun 2020 12:06:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6E06584A75;
	Fri,  5 Jun 2020 10:06:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z0XhnDfuAYZ6; Fri,  5 Jun 2020 10:06:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 68F9D84BE9;
	Fri,  5 Jun 2020 10:06:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35905C0888;
	Fri,  5 Jun 2020 10:06:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3283C016E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 10:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DAA4D8733B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 10:06:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQdh7RRfic+b
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 10:06:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 90C428721E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 10:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591351569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IOHrh61h9xlexkeTxJIfL9Cwk1qH353F9k95j4KpxMg=;
 b=KKFEzGDkEKiEtalGKbUj+U1aly5pVgDsqQn/ZOw8vCmoBqENBSGpoxEhru0yKPIY7yw+dZ
 p76Pxw2xjNeTp2WWCDZyGN3BTFHCcfOVp2U45gVshM2V/9h6utK1xhDT429UXAnThGbb05
 /ALmM2dio1mcKSYSnFuVxrOYv/Vb4XQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-KVBtKMVXPBGRRHUhGtsdTg-1; Fri, 05 Jun 2020 06:06:04 -0400
X-MC-Unique: KVBtKMVXPBGRRHUhGtsdTg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B628835B41;
 Fri,  5 Jun 2020 10:05:59 +0000 (UTC)
Received: from [10.36.114.72] (ovpn-114-72.ams2.redhat.com [10.36.114.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11EB710013C0;
 Fri,  5 Jun 2020 10:05:40 +0000 (UTC)
Subject: Re: [PATCH RFC v4 00/13] virtio-mem: paravirtualized memory
From: David Hildenbrand <david@redhat.com>
To: Alex Shi <alex.shi@linux.alibaba.com>, linux-kernel@vger.kernel.org
References: <20191212171137.13872-1-david@redhat.com>
 <9acc5d04-c8e9-ef53-85e4-709030997ca6@redhat.com>
 <1cfa9edb-47ea-1495-4e28-4cf391eab44c@linux.alibaba.com>
 <d6cd1870-1012-cb3d-7d29-8e5ad2703717@redhat.com>
 <6b4724bf-84b5-9880-5464-1908425d106d@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <e1643897-ebd7-75f8-d271-44f62318aa66@redhat.com>
Date: Fri, 5 Jun 2020 12:05:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <6b4724bf-84b5-9880-5464-1908425d106d@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

T24gMDUuMDYuMjAgMTE6MzYsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IE9uIDA1LjA2LjIw
IDExOjA4LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4gT24gMDUuMDYuMjAgMTA6NTUsIEFs
ZXggU2hpIHdyb3RlOgo+Pj4KPj4+Cj4+PiDlnKggMjAyMC8xLzkg5LiL5Y2IOTo0OCwgRGF2aWQg
SGlsZGVuYnJhbmQg5YaZ6YGTOgo+Pj4+IFBpbmcsCj4+Pj4KPj4+PiBJJ2QgbG92ZSB0byBnZXQg
c29tZSBmZWVkYmFjayBvbgo+Pj4+Cj4+Pj4gYSkgVGhlIHJlbWFpbmluZyBNTSBiaXRzIGZyb20g
TU0gZm9sa3MgKGVzcGVjaWFsbHksIHBhdGNoICM2IGFuZCAjOCkuCj4+Pj4gYikgVGhlIGdlbmVy
YWwgdmlydGlvIGluZnJhc3RydWN0dXJlIChlc3AuIHVhcGkgaW4gcGF0Y2ggIzIpIGZyb20gdmly
dGlvCj4+Pj4gZm9sa3MuCj4+Pj4KPj4+PiBJJ20gcGxhbm5pbmcgdG8gc2VuZCBhIHByb3BlciB2
MSAoIVJGQykgb25jZSBJIGhhdmUgYWxsIG5lY2Vzc2FyeSBNTQo+Pj4+IGFja3MuIEluIHRoZSBt
ZWFud2hpbGUsIEkgd2lsbCBkbyBtb3JlIHRlc3RpbmcgYW5kIG1pbm9yIHJld29ya3MgKGUuZy4s
Cj4+Pj4gZml4ICFDT05GSUdfTlVNQSBjb21waWxhdGlvbikuCj4+Pgo+Pj4KPj4+IEhpIERhdmlk
LAo+Pj4KPj4+IFRoYW5rcyBmb3IgeW91ciB3b3JrIQo+Pj4KPj4+IEkgYW0gdHJ5aW5nIHlvdXIg
aHR0cHM6Ly9naXRodWIuY29tL2RhdmlkaGlsZGVuYnJhbmQvbGludXguZ2l0IHZpcnRpby1tZW0t
djUKPj4+IHdoaWNoIHdvcmtzIGZpbmUgZm9yIG1lLCBidXQganVzdCBhICdETUEgZXJyb3InIGhh
cHBlbnMgd2hlbiBhIHZtIHN0YXJ0IHdpdGgKPj4+IGxlc3MgdGhhbiAyR0IgbWVtb3J5LCBEbyBJ
IG1pc3NlZCBzdGg/Cj4+Cj4+IFBsZWFzZSB1c2UgdGhlIHZpcnRpby1tZW0tdjQgYnJhbmNoIGZv
ciBub3csIHY1IGlzIHN0aWxsIHVuZGVyCj4+IGNvbnN0cnVjdGlvbiAoYW5kIG1pZ2h0IGJlIHNj
cmFwcGVkIGNvbXBsZXRlbHkgaWYgdjQgZ29lcyB1cHN0cmVhbSBhcyBpcykuCj4+Cj4+IExvb2tz
IGxpa2UgYSBETUEgaXNzdWUuIFlvdXIncmUgaG90cGx1Z2dpbmcgMUdCLCB3aGljaCBzaG91bGQg
bm90IHJlYWxseQo+PiBlYXQgdG9vIG11Y2ggbWVtb3J5LiBUaGVyZSB3YXMgYSBzaW1pbGFyIGlz
c3VlIHJlcG9ydGVkIGJ5IEh1aSBpbiBbMV0sCj4+IHdoaWNoIGJvaWxlZCBkb3duIHRvIHdyb25n
IHVzYWdlIG9mIHRoZSBzd2lvdGxiIHBhcmFtZXRlci4KPj4KPj4gSW4gc3VjaCBjYXNlcyB5b3Ug
c2hvdWxkIGFsd2F5cyB0cnkgdG8gcmVwcm9kdWNlIHdpdGggaG90cGx1ZyBvZiBhCj4+IHNhbS1z
aXplZCBESU1NLiBFLmcuLCBob3RwbHVnZ2luZyBhIDFHQiBESU1NIHNob3VsZCByZXN1bHQgaW4g
dGhlIHNhbWUKPj4gaXNzdWUuCj4+Cj4+IFdoYXQgZG9lcyB5b3VyIC5jb25maWcgc3BlY2lmeSBm
b3IgQ09ORklHX01FTU9SWV9IT1RQTFVHX0RFRkFVTFRfT05MSU5FPwo+Pgo+PiBJJ2xsIHRyeSB0
byByZXByb2R1Y2Ugd2l0aCB2NCBicmllZmx5Lgo+IAo+IEkgZ3Vlc3MgSSBrbm93IHdoYXQncyBo
YXBwZW5pbmcgaGVyZS4gSW4gY2FzZSB3ZSBvbmx5IGhhdmUgRE1BIG1lbW9yeQo+IHdoZW4gYm9v
dGluZywgd2UgZG9uJ3QgcmVzZXJ2ZSBzd2lvdGxiIGJ1ZmZlcnMuIE9uY2Ugd2UgaG90cGx1ZyBt
ZW1vcnkKPiBhbmQgb25saW5lIFpPTkVfTk9STUFMLCB3ZSBkb24ndCBoYXZlIGFueSBzd2lvdGxi
IERNQSBib3VuY2UgYnVmZmVycyB0bwo+IG1hcCBzdWNoIFBGTnMgKHRvdGFsIDAgKHNsb3RzKSwg
dXNlZCAwIChzbG90cykpLgo+IAo+IENhbiB5b3UgdHJ5IHdpdGggInN3aW90bGI9Zm9yY2UiIG9u
IHRoZSBrZXJuZWwgY21kbGluZT8KCkFsdGVybmF0aXZlLCBsb29rcyBsaWtlIHlvdSBjYW4gc3Bl
Y2lmeSAiLW0gMkcsbWF4bWVtPTE2RyxzbG90cz0xIiwgdG8KY3JlYXRlIHByb3BlciBBQ1BJIHRh
YmxlcyB0aGF0IGluZGljYXRlIGhvdHBsdWdnYWJsZSBtZW1vcnkuIChJJ2xsIGhhdmUKdG8gbG9v
ayBpbnRvIFFFTVUgdG8gZmlndXJlIG91dCB0byBhbHdheXMgaW5kaWNhdGUgaG90cGx1Z2dhYmxl
IG1lbW9yeQp0aGF0IHdheSkuCgoKLS0gClRoYW5rcywKCkRhdmlkIC8gZGhpbGRlbmIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
