Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FCF1D2F77
	for <lists.virtualization@lfdr.de>; Thu, 14 May 2020 14:20:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BBA6089698;
	Thu, 14 May 2020 12:20:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IT7yeskHUyFu; Thu, 14 May 2020 12:20:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 23B8C89695;
	Thu, 14 May 2020 12:20:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00BF3C016F;
	Thu, 14 May 2020 12:20:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35229C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 12:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3087A874C3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 12:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8rs3ELs01Jsa
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 12:20:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 76E7C874C1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 12:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589458821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9aCz4qvsPpwDokPvw5swdrzksgBU0j0lrQXHgXqHs5M=;
 b=dYXpXTtC1SSAWOKYAyYi+u8VRvcGv3Yi2JDsvOP09s+oeA0QVKudzDoC+ngWXZiYOyFA/0
 h49bz7Ur6BdbBKlap+wtth9NgwErNi+T1SYL5IUPm5Su81KoC/zILTNqfqO+HTxeftJQDC
 x7sD3VzYcFY6qOLTEkgPms5wKNxQ7JY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-gw2F4bHnNB6zA23Q_4lAsg-1; Thu, 14 May 2020 08:20:17 -0400
X-MC-Unique: gw2F4bHnNB6zA23Q_4lAsg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5E121902EA7;
 Thu, 14 May 2020 12:20:12 +0000 (UTC)
Received: from [10.36.114.168] (ovpn-114-168.ams2.redhat.com [10.36.114.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45F1A1001920;
 Thu, 14 May 2020 12:19:52 +0000 (UTC)
Subject: Re: [virtio-dev] [PATCH v3 00/15] virtio-mem: paravirtualized memory
From: David Hildenbrand <david@redhat.com>
To: teawater <teawaterz@linux.alibaba.com>
References: <20200507103119.11219-1-david@redhat.com>
 <7848642F-6AA7-4B5E-AE0E-DB0857C94A93@linux.alibaba.com>
 <31c5d2f9-c104-53e8-d9c8-cb45f7507c85@redhat.com>
 <A3BBAEEE-FBB9-4259-8BED-023CCD530021@linux.alibaba.com>
 <389b6bdc-b196-e4b9-b6be-dcac57524fdf@redhat.com>
 <3c82e149-6c42-690e-9d58-bb8e69870fe0@redhat.com>
 <e48ded49-9b92-7025-a06f-49b24f1c53a6@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <cda84c4d-0f4c-1dd8-44f6-68f211e5de6d@redhat.com>
Date: Thu, 14 May 2020 14:19:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e48ded49-9b92-7025-a06f-49b24f1c53a6@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

T24gMTQuMDUuMjAgMTM6NDcsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IE9uIDE0LjA1LjIw
IDEzOjEwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4gT24gMTQuMDUuMjAgMTI6MTIsIERh
dmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+Pj4gT24gMTQuMDUuMjAgMTI6MDIsIHRlYXdhdGVyIHdy
b3RlOgo+Pj4+Cj4+Pj4KPj4+Pj4gMjAyMOW5tDXmnIgxNOaXpSAxNjo0OO+8jERhdmlkIEhpbGRl
bmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPiDlhpnpgZPvvJoKPj4+Pj4KPj4+Pj4gT24gMTQuMDUu
MjAgMDg6NDQsIHRlYXdhdGVyIHdyb3RlOgo+Pj4+Pj4gSGkgRGF2aWQsCj4+Pj4+Pgo+Pj4+Pj4g
SSBnb3QgYSBrZXJuZWwgd2FybmluZyB3aXRoIHYyIGFuZCB2My4KPj4+Pj4KPj4+Pj4gSGkgSHVp
LAo+Pj4+Pgo+Pj4+PiB0aGFua3MgZm9yIHBsYXlpbmcgd2l0aCB0aGUgbGF0ZXN0IHZlcnNpb25z
LiBTdXJwcmlzaW5nbHksIEkgY2FuCj4+Pj4+IHJlcHJvZHVjZSBldmVuIGJ5IGhvdHBsdWdnaW5n
IGEgRElNTSBpbnN0ZWFkIGFzIHdlbGwgLSB0aGF0J3MgZ29vZCwgc28KPj4+Pj4gaXQncyBub3Qg
cmVsYXRlZCB0byB2aXJ0aW8tbWVtLCBsb2wuIFNlZW1zIHRvIGJlIHNvbWUgUUVNVSBzZXR1cCBp
c3N1ZQo+Pj4+PiB3aXRoIG9sZGVyIG1hY2hpbmUgdHlwZXMuCj4+Pj4+Cj4+Pj4+IENhbiB5b3Ug
c3dpdGNoIHRvIGEgbmV3ZXIgcWVtdSBtYWNoaW5lIHZlcnNpb24sIGVzcGVjaWFsbHkKPj4+Pj4g
cGMtaTQ0MGZ4LTUuMD8gQm90aCwgaG90cGx1Z2dpbmcgRElNTXMgYW5kIHZpcnRpby1tZW0gd29y
a3MgZm9yIG1lIHdpdGgKPj4+Pj4gdGhhdCBRRU1VIG1hY2hpbmUganVzdCBmaW5lLgo+Pj4+Cj4+
Pj4gSSBzdGlsbCBjb3VsZCByZXByb2R1Y2UgdGhpcyBpc3N1ZSB3aXRoIHBjLWk0NDBmeC01LjAg
b3IgcGMuICBEaWQgSSBtaXNzIGFueXRoaW5nPwo+Pj4+Cj4+Pgo+Pj4gQmVsb3cgSSBkb24ndCBl
dmVuIHNlZSB2aXJ0aW9fbWVtLiBJIGhhZCB0byByZXBhaXIgdGhlIGltYWdlIChmaWxlc3lzdGVt
Cj4+PiBmc2NrKSBiZWNhdXNlIGl0IHdhcyBicm9rZW4sIGNhbiB5b3UgdHJ5IHRoYXQgYXMgd2Vs
bD8KPj4+Cj4+PiBBbHNvLCBpdCB3b3VsZCBiZSBncmVhdCBpZiB5b3UgY291bGQgdGVzdCB3aXRo
IHY0Lgo+Pj4KPj4KPj4gQ29ycmVjdGlvbiwgc29tZXRoaW5nIHNlZW1zIHRvIGJlIGJyb2tlbiBl
aXRoZXIgaW4gUUVNVSBvciB0aGUga2VybmVsLiBPbmNlIEkKPj4gZGVmaW5lIGEgRElNTSBzbyBp
dCdzIGFkZGVkIGFuZCBvbmxpbmUgZHVyaW5nIGJvb3QsIEkgZ2V0IHRoZXNlIGlzc3VlczoKPj4K
Pj4gKEkgaGF2ZSB2aXJ0aW8tbWVtIHY0IGluc3RhbGxlZCBpbiB0aGUgZ3Vlc3QpCj4+Cj4+ICMh
IC9iaW4vYmFzaAo+PiBzdWRvIHg4Nl82NC1zb2Z0bW11L3FlbXUtc3lzdGVtLXg4Nl82NCBcCj4+
ICAgICAtbWFjaGluZSBwYy1pNDQwZngtNS4wLGFjY2VsPWt2bSx1c2I9b2ZmIFwKPj4gICAgIC1j
cHUgaG9zdCBcCj4+ICAgICAtbm8tcmVib290IFwKPj4gICAgIC1ub2dyYXBoaWMgXAo+PiAgICAg
LWRldmljZSBpZGUtaGQsZHJpdmU9aGQgXAo+PiAgICAgLWRyaXZlIGlmPW5vbmUsaWQ9aGQsZmls
ZT0vaG9tZS9kaGlsZGVuYi9naXQvRmVkb3JhLUNsb3VkLUJhc2UtMzEtMS45Lng4Nl82NC5xY293
Mixmb3JtYXQ9cWNvdzIgXAo+PiAgICAgLW0gMWcsc2xvdHM9MTAsbWF4bWVtPTJHIFwKPj4gICAg
IC1zbXAgMSBcCj4+ICAgICAtb2JqZWN0IG1lbW9yeS1iYWNrZW5kLXJhbSxpZD1tZW0wLHNpemU9
MjU2bSBcCj4+ICAgICAtZGV2aWNlIHBjLWRpbW0saWQ9ZGltbTAsbWVtZGV2PW1lbTAgXAo+PiAg
ICAgLXMgXAo+PiAgICAgLW1vbml0b3IgdW5peDovdmFyL3RtcC9tb25pdG9yLHNlcnZlcixub3dh
aXQKPj4KPj4KPj4gV2l0aG91dCB0aGUgRElNTSBpdCBzZWVtcyB0byB3b3JrIGp1c3QgZmluZS4K
Pj4KPiAKPiBBbmQgYW5vdGhlciBjb3JyZWN0aW9uLiAKPiAKPiBVc2luZyBRRU1VIHY1LjAuMCwg
TGludXggNS43LXJjNSwgdW50b3VjaGVkCj4gRmVkb3JhLUNsb3VkLUJhc2UtMzItMS42Lng4Nl82
NC5xY293MiwgSSBnZXQgZXZlbiB3aXRob3V0IGFueSBtZW1vcnkgaG90cGx1ZzoKPiAKPiAjISAv
YmluL2Jhc2gKPiBzdWRvIHg4Nl82NC1zb2Z0bW11L3FlbXUtc3lzdGVtLXg4Nl82NCBcCj4gICAg
IC1tYWNoaW5lIHBjLWk0NDBmeC01LjAsYWNjZWw9a3ZtLHVzYj1vZmYgXAo+ICAgICAtY3B1IGhv
c3QgXAo+ICAgICAtbm8tcmVib290IFwKPiAgICAgLW5vZ3JhcGhpYyBcCj4gICAgIC1kZXZpY2Ug
aWRlLWhkLGRyaXZlPWhkIFwKPiAgICAgLWRyaXZlIGlmPW5vbmUsaWQ9aGQsZmlsZT0vaG9tZS9k
aGlsZGVuYi9naXQvRmVkb3JhLUNsb3VkLUJhc2UtMzItMS42Lng4Nl82NC5xY293Mixmb3JtYXQ9
cWNvdzIgXAo+ICAgICAtbSA1ZyxzbG90cz0xMCxtYXhtZW09NkcgXAo+ICAgICAtc21wIDEgXAo+
ICAgICAtcyBcCj4gICAgIC1rZXJuZWwgL2hvbWUvZGhpbGRlbmIvZ2l0L2xpbnV4L2FyY2gveDg2
L2Jvb3QvYnpJbWFnZSBcCj4gICAgIC1hcHBlbmQgImNvbnNvbGU9dHR5UzAgcmQuc2hlbGwgbm9r
YXNsciBzd2lvdGxiPW5vZm9yY2UiIFwKPiAgICAgLW1vbml0b3IgdW5peDovdmFyL3RtcC9tb25p
dG9yLHNlcnZlcixub3dhaXQKPiAKPiAKPiBPYnNlcnZlIGhvdyBiaWcgdGhlIGluaXRpYWwgUkFN
IGV2ZW4gaXMhCj4gCj4gCj4gU28gdGhpcyBpcyBubyBESU1NL2hvdHBsdWcvdmlydGlvX21lbSBp
c3N1ZS4gV2l0aCBtZW1vcnkgaG90cGx1ZywgaXQgc2VlbXMgdG8gZ2V0Cj4gbW9yZSBsaWtlbHkg
dG8gdHJpZ2dlciBpZiAic3dpb3RsYj1ub2ZvcmNlIiBpcyBub3Qgc3BlY2lmaWVkLgo+IAo+ICJz
d2lvdGxiPW5vZm9yY2UiIHNlZW1zIHRvIHRyaWdnZXIgc29tZSBwcmUtZXhpc3RpbmcgaXNzdWUg
aGVyZS4gV2l0aG91dAo+ICJzd2lvdGxiPW5vZm9yY2UiLCBJIHdhcyBvbmx5IGFibGUgdG8gb2Jz
ZXJ2ZSB0aGlzIHZpYSBwYy1pNDQwZngtMi4xLAo+IAoKKHRhbGtpbmcgdG8gbXlzZWxmIDopICkK
CkkgdGhpbmsgSSBmaW5hbGx5IHVuZGVyc3Rvb2Qgd2h5IHVzaW5nICJzd2lvdGxiPW5vZm9yY2Ui
IHdpdGggaG90cGx1Z2dlZAptZW1vcnkgaXMgd3JvbmcgLSBvciB3aXRoIG1lbW9yeSA+IDNHQi4g
VmlhICJzd2lvdGxiPW5vZm9yY2UiIHlvdSB0ZWxsCnRoZSBzeXN0ZW0gdG8gIk5ldmVyIHVzZSBi
b3VuY2UgYnVmZmVycyAoZm9yIGRlYnVnZ2luZykiLiBUaGlzIHdvcmtzIGFzCmxvbmcgYXMgYWxs
IG1lbW9yeSBpcyBETUEgbWVtb3J5IChlLmcuLCA8IDNHQikgQUZBSUsuCgoiSWYgc3BlY2lmaWVk
LCB0cnlpbmcgdG8gbWFwIG1lbW9yeSB0aGF0IGNhbm5vdCBiZSB1c2VkIHdpdGggRE1BIHdpbGwK
ZmFpbCwgYW5kIGEgcmF0ZS1saW1pdGVkIHdhcm5pbmcgd2lsbCBiZSBwcmludGVkLiIKCkhvdHBs
dWdnZWQgbWVtb3J5ICh1bmRlciBRRU1VKSBpcyBuZXZlciBhZGRlZCBiZWxvdyA0R0IsIGJlY2F1
c2Ugb2YgdGhlClBDSSBob2xlLiBTbyBib3RoLCBtZW1vcnkgZnJvbSBESU1NcyBhbmQgZnJvbSB2
aXJ0aW8tbWVtIHdpbGwgZW5kIHVwIGF0Cm9yIGFib3ZlIDRHQi4gVG8gbWFrZSBhIGRldmljZSB1
c2UgdGhhdCBtZW1vcnksIHlvdSBuZWVkIGJvdW5jZSBidWZmZXJzLgoKSG90cGx1Z2dlZCBtZW1v
cnkgaXMgbmV2ZXIgRE1BIG1lbW9yeS4KCi0tIApUaGFua3MsCgpEYXZpZCAvIGRoaWxkZW5iCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
