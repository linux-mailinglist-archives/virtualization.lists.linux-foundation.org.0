Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF691EF3B8
	for <lists.virtualization@lfdr.de>; Fri,  5 Jun 2020 11:09:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7DB63231E9;
	Fri,  5 Jun 2020 09:09:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1bu92K6i73dP; Fri,  5 Jun 2020 09:09:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CAB2E203D1;
	Fri,  5 Jun 2020 09:09:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A54A6C016E;
	Fri,  5 Jun 2020 09:09:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BF013C016E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 09:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ACB3086FD8
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 09:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A_x9isCwBtrh
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 09:09:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 40A9186EB4
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 09:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591348155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=F4NHHC79n17giKLMo5VoyVCEUYO/fk1+yWE2JKf8Ozw=;
 b=PKxWlIryi+vepSwFTS/x5JLgl1oDfVW3Sx0kaEL7R5MZfz/n1x2qHNsTIQAlrK+b/GsVol
 zglpwKT30Tu8zsLfWtvIXGjbsKqYTrXBpj3BD0q2UyrDuGZ9vScD4qZ4ITEq1043jNlBD5
 3N0vFAcjVNo4YQIIBW/8+7AvUFl7L+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-PnttmtdNOZ2PagLhqTwNJA-1; Fri, 05 Jun 2020 05:09:11 -0400
X-MC-Unique: PnttmtdNOZ2PagLhqTwNJA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28118BFC1;
 Fri,  5 Jun 2020 09:09:03 +0000 (UTC)
Received: from [10.36.114.72] (ovpn-114-72.ams2.redhat.com [10.36.114.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F3F45C1B0;
 Fri,  5 Jun 2020 09:08:44 +0000 (UTC)
Subject: Re: [PATCH RFC v4 00/13] virtio-mem: paravirtualized memory
To: Alex Shi <alex.shi@linux.alibaba.com>, linux-kernel@vger.kernel.org
References: <20191212171137.13872-1-david@redhat.com>
 <9acc5d04-c8e9-ef53-85e4-709030997ca6@redhat.com>
 <1cfa9edb-47ea-1495-4e28-4cf391eab44c@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <d6cd1870-1012-cb3d-7d29-8e5ad2703717@redhat.com>
Date: Fri, 5 Jun 2020 11:08:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1cfa9edb-47ea-1495-4e28-4cf391eab44c@linux.alibaba.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

T24gMDUuMDYuMjAgMTA6NTUsIEFsZXggU2hpIHdyb3RlOgo+IAo+IAo+IOWcqCAyMDIwLzEvOSDk
uIvljYg5OjQ4LCBEYXZpZCBIaWxkZW5icmFuZCDlhpnpgZM6Cj4+IFBpbmcsCj4+Cj4+IEknZCBs
b3ZlIHRvIGdldCBzb21lIGZlZWRiYWNrIG9uCj4+Cj4+IGEpIFRoZSByZW1haW5pbmcgTU0gYml0
cyBmcm9tIE1NIGZvbGtzIChlc3BlY2lhbGx5LCBwYXRjaCAjNiBhbmQgIzgpLgo+PiBiKSBUaGUg
Z2VuZXJhbCB2aXJ0aW8gaW5mcmFzdHJ1Y3R1cmUgKGVzcC4gdWFwaSBpbiBwYXRjaCAjMikgZnJv
bSB2aXJ0aW8KPj4gZm9sa3MuCj4+Cj4+IEknbSBwbGFubmluZyB0byBzZW5kIGEgcHJvcGVyIHYx
ICghUkZDKSBvbmNlIEkgaGF2ZSBhbGwgbmVjZXNzYXJ5IE1NCj4+IGFja3MuIEluIHRoZSBtZWFu
d2hpbGUsIEkgd2lsbCBkbyBtb3JlIHRlc3RpbmcgYW5kIG1pbm9yIHJld29ya3MgKGUuZy4sCj4+
IGZpeCAhQ09ORklHX05VTUEgY29tcGlsYXRpb24pLgo+IAo+IAo+IEhpIERhdmlkLAo+IAo+IFRo
YW5rcyBmb3IgeW91ciB3b3JrIQo+IAo+IEkgYW0gdHJ5aW5nIHlvdXIgaHR0cHM6Ly9naXRodWIu
Y29tL2RhdmlkaGlsZGVuYnJhbmQvbGludXguZ2l0IHZpcnRpby1tZW0tdjUKPiB3aGljaCB3b3Jr
cyBmaW5lIGZvciBtZSwgYnV0IGp1c3QgYSAnRE1BIGVycm9yJyBoYXBwZW5zIHdoZW4gYSB2bSBz
dGFydCB3aXRoCj4gbGVzcyB0aGFuIDJHQiBtZW1vcnksIERvIEkgbWlzc2VkIHN0aD8KClBsZWFz
ZSB1c2UgdGhlIHZpcnRpby1tZW0tdjQgYnJhbmNoIGZvciBub3csIHY1IGlzIHN0aWxsIHVuZGVy
CmNvbnN0cnVjdGlvbiAoYW5kIG1pZ2h0IGJlIHNjcmFwcGVkIGNvbXBsZXRlbHkgaWYgdjQgZ29l
cyB1cHN0cmVhbSBhcyBpcykuCgpMb29rcyBsaWtlIGEgRE1BIGlzc3VlLiBZb3VyJ3JlIGhvdHBs
dWdnaW5nIDFHQiwgd2hpY2ggc2hvdWxkIG5vdCByZWFsbHkKZWF0IHRvbyBtdWNoIG1lbW9yeS4g
VGhlcmUgd2FzIGEgc2ltaWxhciBpc3N1ZSByZXBvcnRlZCBieSBIdWkgaW4gWzFdLAp3aGljaCBi
b2lsZWQgZG93biB0byB3cm9uZyB1c2FnZSBvZiB0aGUgc3dpb3RsYiBwYXJhbWV0ZXIuCgpJbiBz
dWNoIGNhc2VzIHlvdSBzaG91bGQgYWx3YXlzIHRyeSB0byByZXByb2R1Y2Ugd2l0aCBob3RwbHVn
IG9mIGEKc2FtLXNpemVkIERJTU0uIEUuZy4sIGhvdHBsdWdnaW5nIGEgMUdCIERJTU0gc2hvdWxk
IHJlc3VsdCBpbiB0aGUgc2FtZQppc3N1ZS4KCldoYXQgZG9lcyB5b3VyIC5jb25maWcgc3BlY2lm
eSBmb3IgQ09ORklHX01FTU9SWV9IT1RQTFVHX0RFRkFVTFRfT05MSU5FPwoKSSdsbCB0cnkgdG8g
cmVwcm9kdWNlIHdpdGggdjQgYnJpZWZseS4KClsxXQpodHRwczovL2xrbWwua2VybmVsLm9yZy9y
Lzk3MDhGNDNBLTlCRDItNDM3Ny04RUU4LTdGQjFEOTVDNkY2OUBsaW51eC5hbGliYWJhLmNvbQoK
PiAKPiBUaGFua3MKPiBBbGV4Cj4gCj4gCj4gKHFlbXUpIHFvbS1zZXQgdm0wIHJlcXVlc3RlZC1z
aXplIDFnCj4gKHFlbXUpIFsgICAyNi41NjAwMjZdIHZpcnRpb19tZW0gdmlydGlvMDogcGx1Z2dl
ZCBzaXplOiAweDAKPiBbICAgMjYuNTYwNjQ4XSB2aXJ0aW9fbWVtIHZpcnRpbzA6IHJlcXVlc3Rl
ZCBzaXplOiAweDQwMDAwMDAwCj4gWyAgIDI2LjU2MTczMF0gc3lzdGVtZC1qb3VybmFsZFsxNjdd
OiBubyBkYiBmaWxlIHRvIHJlYWQgL3J1bi91ZGV2L2RhdGEvK3ZpcnRpbzp2aXJ0aW8wOiBObyBz
dWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gWyAgIDI2LjU2MzEzOF0gc3lzdGVtZC1qb3VybmFsZFsx
NjddOiBubyBkYiBmaWxlIHRvIHJlYWQgL3J1bi91ZGV2L2RhdGEvK3ZpcnRpbzp2aXJ0aW8wOiBO
byBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gWyAgIDI2LjU2OTEyMl0gQnVpbHQgMSB6b25lbGlz
dHMsIG1vYmlsaXR5IGdyb3VwaW5nIG9uLiAgVG90YWwgcGFnZXM6IDUxMzE0MQo+IFsgICAyNi41
NzAwMzldIFBvbGljeSB6b25lOiBOb3JtYWwKPiAKPiAocWVtdSkgWyAgIDMyLjE3NTgzOF0gZTEw
MDAgMDAwMDowMDowMy4wOiBzd2lvdGxiIGJ1ZmZlciBpcyBmdWxsIChzejogODEgYnl0ZXMpLCB0
b3RhbCAwIChzbG90cyksIHVzZWQgMCAoc2xvdHMpCj4gWyAgIDMyLjE3NjkyMl0gZTEwMDAgMDAw
MDowMDowMy4wOiBUWCBETUEgbWFwIGZhaWxlZAo+IFsgICAzMi4xNzc0ODhdIGUxMDAwIDAwMDA6
MDA6MDMuMDogc3dpb3RsYiBidWZmZXIgaXMgZnVsbCAoc3o6IDgxIGJ5dGVzKSwgdG90YWwgMCAo
c2xvdHMpLCB1c2VkIDAgKHNsb3RzKQo+IFsgICAzMi4xNzg1MzVdIGUxMDAwIDAwMDA6MDA6MDMu
MDogVFggRE1BIG1hcCBmYWlsZWQKPiAKPiBteSBxZW11IGNvbW1hbmQgaXMgbGlrZSB0aGlzOgo+
IHFlbXUtc3lzdGVtLXg4Nl82NCAgLS1lbmFibGUta3ZtIFwKPiAJLW0gMkcsbWF4bWVtPTE2RyAt
a2VybmVsIC9yb290L2xpbnV4LW5leHQvJDEvYXJjaC94ODYvYm9vdC9iekltYWdlIFwKPiAJLXNt
cCA0IFwKPiAJLWFwcGVuZCAiZWFybHlwcmludGs9dHR5UzAgcm9vdD0vZGV2L3NkYTEgY29uc29s
ZT10dHlTMCBkZWJ1ZyBwc2k9MSBub2thc2xyIGlnbm9yZV9sb2dsZXZlbCIgXAo+IAktaGRhIC9y
b290L0NlbnRPUy03LXg4Nl82NC1BenVyZS0xNzAzLnFjb3cyIFwKPiAJLW5ldCB1c2VyLGhvc3Rm
d2Q9dGNwOjoyMjIyLToyMiAtbmV0IG5pYyAtcyBcCj4gICAtb2JqZWN0IG1lbW9yeS1iYWNrZW5k
LXJhbSxpZD1tZW0wLHNpemU9M0cgXAo+ICAgLWRldmljZSB2aXJ0aW8tbWVtLXBjaSxpZD12bTAs
bWVtZGV2PW1lbTAsbm9kZT0wLHJlcXVlc3RlZC1zaXplPTBNIFwKPiAJLS1ub2dyYXBoaWMKPiAK
PiAKCgotLSAKVGhhbmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZp
cnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
