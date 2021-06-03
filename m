Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B163997A9
	for <lists.virtualization@lfdr.de>; Thu,  3 Jun 2021 03:48:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 352C140571;
	Thu,  3 Jun 2021 01:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ni-N1CTwx-Fg; Thu,  3 Jun 2021 01:48:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id F140240573;
	Thu,  3 Jun 2021 01:48:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C6BFC0001;
	Thu,  3 Jun 2021 01:48:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 700B3C0001;
 Thu,  3 Jun 2021 01:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D4AD40570;
 Thu,  3 Jun 2021 01:48:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1zqRYvACBoFW; Thu,  3 Jun 2021 01:48:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DF394052B;
 Thu,  3 Jun 2021 01:48:14 +0000 (UTC)
IronPort-SDR: rWsP1/+zY9VUT2AtasztRZIlPab4zCdxOZ2PRsTXc0EK4XyD4tS4QUCG9t9cAdI37AVDIRNC01
 7StY0nF5Z1bw==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="203933377"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="203933377"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 18:48:13 -0700
IronPort-SDR: Jyw3YKKGYvj7bwLmvWR2S0qa6bCxBwrGKuTWS3IjTqLGizol08X7sJz0tD5Vwuml83+tl+G6q3
 taWf8WDdxL7A==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="550517043"
Received: from akleen-mobl1.amr.corp.intel.com (HELO [10.209.87.193])
 ([10.209.87.193])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 18:48:12 -0700
Subject: Re: [PATCH v1 1/8] virtio: Force only split mode with protected guest
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com
References: <20210603004133.4079390-1-ak@linux.intel.com>
 <20210603004133.4079390-2-ak@linux.intel.com>
 <28c8302b-6833-10b4-c0eb-67456e7c4069@redhat.com>
From: Andi Kleen <ak@linux.intel.com>
Message-ID: <09e17c7f-ce51-1a46-72c4-12223bee4e3a@linux.intel.com>
Date: Wed, 2 Jun 2021 18:48:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <28c8302b-6833-10b4-c0eb-67456e7c4069@redhat.com>
Content-Language: en-US
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, jpoimboe@redhat.com, robin.murphy@arm.com,
 hch@lst.de, m.szyprowski@samsung.com
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Cj4gU28gd2Ugd2lsbCBzZWUgaHVnZSBwZXJmb3JtYW5jZSByZWdyZXNzaW9uIHdpdGhvdXQgaW5k
aXJlY3QgCj4gZGVzY3JpcHRvci4gV2UgbmVlZCB0byBjb25zaWRlciB0byBhZGRyZXNzIHRoaXMu
CgpBIHJlZ3Jlc3Npb24gd291bGQgYmUgd2hlbiBzb21lIGV4aXN0aW5nIGNhc2Ugd291bGQgYmUg
c2xvd2VyLgoKVGhhdCdzIG5vdCB0aGUgY2FzZSBiZWNhdXNlIHRoZSBiZWhhdmlvciBmb3IgdGhl
IGV4aXN0aW5nIGNhc2VzIGRvZXMgbm90IApjaGFuZ2UuCgpBbnl3YXlzIHdoZW4gdGhlcmUgYXJl
IHBlcmZvcm1hbmNlIHByb2JsZW1zIHRoZXkgY2FuIGJlIGFkZHJlc3NlZCwgYnV0IApmaXJzdCBp
cyB0byBtYWtlIGl0IHNlY3VyZS4KCi1BbmRpCgoKPgo+IFRoYW5rcwo+Cj4KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIFZJUlRJ
T19SSU5HX0ZfRVZFTlRfSURYOgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsK
Pj4gQEAgLTIyMzEsOSArMjI0MCwxMiBAQCB2b2lkIHZyaW5nX3RyYW5zcG9ydF9mZWF0dXJlcyhz
dHJ1Y3QgCj4+IHZpcnRpb19kZXZpY2UgKnZkZXYpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNl
IFZJUlRJT19GX0FDQ0VTU19QTEFURk9STToKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
YnJlYWs7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIFZJUlRJT19GX1JJTkdfUEFDS0VEOgo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocHJvdGVjdGVkX2d1ZXN0X2hhcyhWTV9NRU1f
RU5DUllQVCkpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBjbGVhcjsK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBjYXNlIFZJUlRJT19GX09SREVSX1BMQVRGT1JNOgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBicmVhazsKPj4gK8KgwqDCoMKgwqDCoMKgIGNsZWFyOgo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgZGVmYXVsdDoKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogV2UgZG9uJ3QgdW5k
ZXJzdGFuZCB0aGlzIGJpdC4gKi8KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX192aXJ0
aW9fY2xlYXJfYml0KHZkZXYsIGkpOwo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
