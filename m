Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC581D2EB5
	for <lists.virtualization@lfdr.de>; Thu, 14 May 2020 13:48:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E5BD788A06;
	Thu, 14 May 2020 11:47:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jk4pmhbpgcz8; Thu, 14 May 2020 11:47:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 76D0488A07;
	Thu, 14 May 2020 11:47:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4EAB9C016F;
	Thu, 14 May 2020 11:47:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89E14C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 11:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5DD0F20472
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 11:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plSgFSEj6G1b
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 11:47:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 3DA722045B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 11:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589456874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=056DKdN3KPKaq3Rpf9197+FNfLlAWAvO0GFOK8GoZgU=;
 b=EoMs487NxZSWz+05f954kkjaxgLGbrc4+BYBT22lB3JbChFV+JJZ26qqUtlFCoRDwlAIrj
 F5Zx3ddonU4mznlAz5qY0BlCMc8VClQaDi9gOOSTlE2/xB09N5NA0lbyurnMxwom6RINa6
 0AzHKlondRUYaxGUzsrydDt5KHBttB4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-2pjtMo-DPcWD1-g1OZKniw-1; Thu, 14 May 2020 07:47:50 -0400
X-MC-Unique: 2pjtMo-DPcWD1-g1OZKniw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D46E7835B40;
 Thu, 14 May 2020 11:47:45 +0000 (UTC)
Received: from [10.36.114.168] (ovpn-114-168.ams2.redhat.com [10.36.114.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A51201C933;
 Thu, 14 May 2020 11:47:24 +0000 (UTC)
Subject: Re: [virtio-dev] [PATCH v3 00/15] virtio-mem: paravirtualized memory
From: David Hildenbrand <david@redhat.com>
To: teawater <teawaterz@linux.alibaba.com>
References: <20200507103119.11219-1-david@redhat.com>
 <7848642F-6AA7-4B5E-AE0E-DB0857C94A93@linux.alibaba.com>
 <31c5d2f9-c104-53e8-d9c8-cb45f7507c85@redhat.com>
 <A3BBAEEE-FBB9-4259-8BED-023CCD530021@linux.alibaba.com>
 <389b6bdc-b196-e4b9-b6be-dcac57524fdf@redhat.com>
 <3c82e149-6c42-690e-9d58-bb8e69870fe0@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <e48ded49-9b92-7025-a06f-49b24f1c53a6@redhat.com>
Date: Thu, 14 May 2020 13:47:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3c82e149-6c42-690e-9d58-bb8e69870fe0@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Oscar Salvador <osalvador@suse.com>, Michal Hocko <mhocko@suse.com>,
 Robert Bradford <robert.bradford@intel.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Pingfan Liu <kernelfans@gmail.com>,
 Luiz Capitulino <lcapitulino@redhat.com>, Linux MM <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 virtio-dev@lists.oasis-open.org, kvm@vger.kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Wei Yang <richard.weiyang@gmail.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Dave Young <dyoung@redhat.com>,
 Len Brown <lenb@kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Qian Cai <cai@lca.pw>,
 Stefan Hajnoczi <stefanha@redhat.com>, Samuel Ortiz <samuel.ortiz@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>,
 Juergen Gross <jgross@suse.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
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

T24gMTQuMDUuMjAgMTM6MTAsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IE9uIDE0LjA1LjIw
IDEyOjEyLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4gT24gMTQuMDUuMjAgMTI6MDIsIHRl
YXdhdGVyIHdyb3RlOgo+Pj4KPj4+Cj4+Pj4gMjAyMOW5tDXmnIgxNOaXpSAxNjo0OO+8jERhdmlk
IEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPiDlhpnpgZPvvJoKPj4+Pgo+Pj4+IE9uIDE0
LjA1LjIwIDA4OjQ0LCB0ZWF3YXRlciB3cm90ZToKPj4+Pj4gSGkgRGF2aWQsCj4+Pj4+Cj4+Pj4+
IEkgZ290IGEga2VybmVsIHdhcm5pbmcgd2l0aCB2MiBhbmQgdjMuCj4+Pj4KPj4+PiBIaSBIdWks
Cj4+Pj4KPj4+PiB0aGFua3MgZm9yIHBsYXlpbmcgd2l0aCB0aGUgbGF0ZXN0IHZlcnNpb25zLiBT
dXJwcmlzaW5nbHksIEkgY2FuCj4+Pj4gcmVwcm9kdWNlIGV2ZW4gYnkgaG90cGx1Z2dpbmcgYSBE
SU1NIGluc3RlYWQgYXMgd2VsbCAtIHRoYXQncyBnb29kLCBzbwo+Pj4+IGl0J3Mgbm90IHJlbGF0
ZWQgdG8gdmlydGlvLW1lbSwgbG9sLiBTZWVtcyB0byBiZSBzb21lIFFFTVUgc2V0dXAgaXNzdWUK
Pj4+PiB3aXRoIG9sZGVyIG1hY2hpbmUgdHlwZXMuCj4+Pj4KPj4+PiBDYW4geW91IHN3aXRjaCB0
byBhIG5ld2VyIHFlbXUgbWFjaGluZSB2ZXJzaW9uLCBlc3BlY2lhbGx5Cj4+Pj4gcGMtaTQ0MGZ4
LTUuMD8gQm90aCwgaG90cGx1Z2dpbmcgRElNTXMgYW5kIHZpcnRpby1tZW0gd29ya3MgZm9yIG1l
IHdpdGgKPj4+PiB0aGF0IFFFTVUgbWFjaGluZSBqdXN0IGZpbmUuCj4+Pgo+Pj4gSSBzdGlsbCBj
b3VsZCByZXByb2R1Y2UgdGhpcyBpc3N1ZSB3aXRoIHBjLWk0NDBmeC01LjAgb3IgcGMuICBEaWQg
SSBtaXNzIGFueXRoaW5nPwo+Pj4KPj4KPj4gQmVsb3cgSSBkb24ndCBldmVuIHNlZSB2aXJ0aW9f
bWVtLiBJIGhhZCB0byByZXBhaXIgdGhlIGltYWdlIChmaWxlc3lzdGVtCj4+IGZzY2spIGJlY2F1
c2UgaXQgd2FzIGJyb2tlbiwgY2FuIHlvdSB0cnkgdGhhdCBhcyB3ZWxsPwo+Pgo+PiBBbHNvLCBp
dCB3b3VsZCBiZSBncmVhdCBpZiB5b3UgY291bGQgdGVzdCB3aXRoIHY0Lgo+Pgo+IAo+IENvcnJl
Y3Rpb24sIHNvbWV0aGluZyBzZWVtcyB0byBiZSBicm9rZW4gZWl0aGVyIGluIFFFTVUgb3IgdGhl
IGtlcm5lbC4gT25jZSBJCj4gZGVmaW5lIGEgRElNTSBzbyBpdCdzIGFkZGVkIGFuZCBvbmxpbmUg
ZHVyaW5nIGJvb3QsIEkgZ2V0IHRoZXNlIGlzc3VlczoKPiAKPiAoSSBoYXZlIHZpcnRpby1tZW0g
djQgaW5zdGFsbGVkIGluIHRoZSBndWVzdCkKPiAKPiAjISAvYmluL2Jhc2gKPiBzdWRvIHg4Nl82
NC1zb2Z0bW11L3FlbXUtc3lzdGVtLXg4Nl82NCBcCj4gICAgIC1tYWNoaW5lIHBjLWk0NDBmeC01
LjAsYWNjZWw9a3ZtLHVzYj1vZmYgXAo+ICAgICAtY3B1IGhvc3QgXAo+ICAgICAtbm8tcmVib290
IFwKPiAgICAgLW5vZ3JhcGhpYyBcCj4gICAgIC1kZXZpY2UgaWRlLWhkLGRyaXZlPWhkIFwKPiAg
ICAgLWRyaXZlIGlmPW5vbmUsaWQ9aGQsZmlsZT0vaG9tZS9kaGlsZGVuYi9naXQvRmVkb3JhLUNs
b3VkLUJhc2UtMzEtMS45Lng4Nl82NC5xY293Mixmb3JtYXQ9cWNvdzIgXAo+ICAgICAtbSAxZyxz
bG90cz0xMCxtYXhtZW09MkcgXAo+ICAgICAtc21wIDEgXAo+ICAgICAtb2JqZWN0IG1lbW9yeS1i
YWNrZW5kLXJhbSxpZD1tZW0wLHNpemU9MjU2bSBcCj4gICAgIC1kZXZpY2UgcGMtZGltbSxpZD1k
aW1tMCxtZW1kZXY9bWVtMCBcCj4gICAgIC1zIFwKPiAgICAgLW1vbml0b3IgdW5peDovdmFyL3Rt
cC9tb25pdG9yLHNlcnZlcixub3dhaXQKPiAKPiAKPiBXaXRob3V0IHRoZSBESU1NIGl0IHNlZW1z
IHRvIHdvcmsganVzdCBmaW5lLgo+IAoKQW5kIGFub3RoZXIgY29ycmVjdGlvbi4gCgpVc2luZyBR
RU1VIHY1LjAuMCwgTGludXggNS43LXJjNSwgdW50b3VjaGVkCkZlZG9yYS1DbG91ZC1CYXNlLTMy
LTEuNi54ODZfNjQucWNvdzIsIEkgZ2V0IGV2ZW4gd2l0aG91dCBhbnkgbWVtb3J5IGhvdHBsdWc6
CgojISAvYmluL2Jhc2gKc3VkbyB4ODZfNjQtc29mdG1tdS9xZW11LXN5c3RlbS14ODZfNjQgXAog
ICAgLW1hY2hpbmUgcGMtaTQ0MGZ4LTUuMCxhY2NlbD1rdm0sdXNiPW9mZiBcCiAgICAtY3B1IGhv
c3QgXAogICAgLW5vLXJlYm9vdCBcCiAgICAtbm9ncmFwaGljIFwKICAgIC1kZXZpY2UgaWRlLWhk
LGRyaXZlPWhkIFwKICAgIC1kcml2ZSBpZj1ub25lLGlkPWhkLGZpbGU9L2hvbWUvZGhpbGRlbmIv
Z2l0L0ZlZG9yYS1DbG91ZC1CYXNlLTMyLTEuNi54ODZfNjQucWNvdzIsZm9ybWF0PXFjb3cyIFwK
ICAgIC1tIDVnLHNsb3RzPTEwLG1heG1lbT02RyBcCiAgICAtc21wIDEgXAogICAgLXMgXAogICAg
LWtlcm5lbCAvaG9tZS9kaGlsZGVuYi9naXQvbGludXgvYXJjaC94ODYvYm9vdC9iekltYWdlIFwK
ICAgIC1hcHBlbmQgImNvbnNvbGU9dHR5UzAgcmQuc2hlbGwgbm9rYXNsciBzd2lvdGxiPW5vZm9y
Y2UiIFwKICAgIC1tb25pdG9yIHVuaXg6L3Zhci90bXAvbW9uaXRvcixzZXJ2ZXIsbm93YWl0CgoK
T2JzZXJ2ZSBob3cgYmlnIHRoZSBpbml0aWFsIFJBTSBldmVuIGlzIQoKClNvIHRoaXMgaXMgbm8g
RElNTS9ob3RwbHVnL3ZpcnRpb19tZW0gaXNzdWUuIFdpdGggbWVtb3J5IGhvdHBsdWcsIGl0IHNl
ZW1zIHRvIGdldAptb3JlIGxpa2VseSB0byB0cmlnZ2VyIGlmICJzd2lvdGxiPW5vZm9yY2UiIGlz
IG5vdCBzcGVjaWZpZWQuCgoic3dpb3RsYj1ub2ZvcmNlIiBzZWVtcyB0byB0cmlnZ2VyIHNvbWUg
cHJlLWV4aXN0aW5nIGlzc3VlIGhlcmUuIFdpdGhvdXQKInN3aW90bGI9bm9mb3JjZSIsIEkgd2Fz
IG9ubHkgYWJsZSB0byBvYnNlcnZlIHRoaXMgdmlhIHBjLWk0NDBmeC0yLjEsCgotLSAKVGhhbmtz
LAoKRGF2aWQgLyBkaGlsZGVuYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
