Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7453A1EF723
	for <lists.virtualization@lfdr.de>; Fri,  5 Jun 2020 14:19:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EC358883C0;
	Fri,  5 Jun 2020 12:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uvJ7FGonqEKB; Fri,  5 Jun 2020 12:19:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4992A882A8;
	Fri,  5 Jun 2020 12:19:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2CB58C016E;
	Fri,  5 Jun 2020 12:19:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55F10C016E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 12:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 50F7288BFD
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 12:18:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G6h-BTDWvsGP
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 12:18:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4CC5288BFB
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 12:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591359535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dBhHWdHap7rN0xoRC5rUckuS8RISJgmWxXhFYfk8D9c=;
 b=iYjpraOGnQVDUeevu9EY9elSNv/IVh/zapZ3L3OQvpDyGlVV2pWID6ETYcxBHhBnkb1UlV
 wObuE7gHQO6vTt90y1ArKC+VNAvcYSGXjhb1i7np1QiEMQuBFuhntNZ26z8UePf4+/i5Hi
 OQP07GlXQKE9SaENdv8ab0j0vYj4OHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-69-usHOpP5-CZe8lBRlUpg-1; Fri, 05 Jun 2020 08:18:54 -0400
X-MC-Unique: 69-usHOpP5-CZe8lBRlUpg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FC111005510;
 Fri,  5 Jun 2020 12:18:49 +0000 (UTC)
Received: from [10.36.114.72] (ovpn-114-72.ams2.redhat.com [10.36.114.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD7E775294;
 Fri,  5 Jun 2020 12:18:29 +0000 (UTC)
Subject: Re: [PATCH RFC v4 00/13] virtio-mem: paravirtualized memory
To: Alex Shi <alex.shi@linux.alibaba.com>, linux-kernel@vger.kernel.org
References: <20191212171137.13872-1-david@redhat.com>
 <9acc5d04-c8e9-ef53-85e4-709030997ca6@redhat.com>
 <1cfa9edb-47ea-1495-4e28-4cf391eab44c@linux.alibaba.com>
 <d6cd1870-1012-cb3d-7d29-8e5ad2703717@redhat.com>
 <6b4724bf-84b5-9880-5464-1908425d106d@redhat.com>
 <e1643897-ebd7-75f8-d271-44f62318aa66@redhat.com>
 <95c6ef21-23e0-c768-999d-3af7f69d02d3@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <b41dcc92-604e-0c48-92e5-5cb3d78f189e@redhat.com>
Date: Fri, 5 Jun 2020 14:18:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <95c6ef21-23e0-c768-999d-3af7f69d02d3@linux.alibaba.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

T24gMDUuMDYuMjAgMTI6NDYsIEFsZXggU2hpIHdyb3RlOgo+IAo+IAo+IOWcqCAyMDIwLzYvNSDk
uIvljYg2OjA1LCBEYXZpZCBIaWxkZW5icmFuZCDlhpnpgZM6Cj4+PiBJIGd1ZXNzIEkga25vdyB3
aGF0J3MgaGFwcGVuaW5nIGhlcmUuIEluIGNhc2Ugd2Ugb25seSBoYXZlIERNQSBtZW1vcnkKPj4+
IHdoZW4gYm9vdGluZywgd2UgZG9uJ3QgcmVzZXJ2ZSBzd2lvdGxiIGJ1ZmZlcnMuIE9uY2Ugd2Ug
aG90cGx1ZyBtZW1vcnkKPj4+IGFuZCBvbmxpbmUgWk9ORV9OT1JNQUwsIHdlIGRvbid0IGhhdmUg
YW55IHN3aW90bGIgRE1BIGJvdW5jZSBidWZmZXJzIHRvCj4+PiBtYXAgc3VjaCBQRk5zICh0b3Rh
bCAwIChzbG90cyksIHVzZWQgMCAoc2xvdHMpKS4KPj4+Cj4+PiBDYW4geW91IHRyeSB3aXRoICJz
d2lvdGxiPWZvcmNlIiBvbiB0aGUga2VybmVsIGNtZGxpbmU/Cj4+IEFsdGVybmF0aXZlLCBsb29r
cyBsaWtlIHlvdSBjYW4gc3BlY2lmeSAiLW0gMkcsbWF4bWVtPTE2RyxzbG90cz0xIiwgdG8KPj4g
Y3JlYXRlIHByb3BlciBBQ1BJIHRhYmxlcyB0aGF0IGluZGljYXRlIGhvdHBsdWdnYWJsZSBtZW1v
cnkuIChJJ2xsIGhhdmUKPj4gdG8gbG9vayBpbnRvIFFFTVUgdG8gZmlndXJlIG91dCB0byBhbHdh
eXMgaW5kaWNhdGUgaG90cGx1Z2dhYmxlIG1lbW9yeQo+PiB0aGF0IHdheSkuCj4+Cj4gCj4gCj4g
VGhhdCB3b3JrcyB0b28uIFllcywgYmV0dGVyIHJlc29sdmVkIGluIHFlbXUsIG1heWJlLiA6KQo+
IAoKWW91IGNhbiBjaGVja291dAoKZ2l0QGdpdGh1Yi5jb206ZGF2aWRoaWxkZW5icmFuZC9xZW11
LmdpdCB2aXJ0aW8tbWVtLXY0CgoocHJvbmUgdG8gY2hhbmdlIGJlZm9yZSBvZmZpY2lhbGx5IHNl
bnQpLCB3aGljaCB3aWxsIGNyZWF0ZSBzcmF0IHRhYmxlcwphbHNvIGlmIG5vICJzbG90cyIgcGFy
YW1ldGVyIHdhcyBkZWZpbmVkIChhbmQgbm8gLW51bWEgY29uZmlnIHdhcwpzcGVjaWZpZWQpLgoK
WW91ciBvcmlnaW5hbCBleGFtcGxlIHNob3VsZCB3b3JrIHdpdGggdGhhdC4KCi0tIApUaGFua3Ms
CgpEYXZpZCAvIGRoaWxkZW5iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
