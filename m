Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED0C15158B
	for <lists.virtualization@lfdr.de>; Tue,  4 Feb 2020 06:45:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C146584BC1;
	Tue,  4 Feb 2020 05:45:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wIr7WdXcCG54; Tue,  4 Feb 2020 05:45:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8418384BCF;
	Tue,  4 Feb 2020 05:45:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 664AFC0174;
	Tue,  4 Feb 2020 05:45:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE50EC0174
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 05:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A4D4185465
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 05:45:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PEnlM9cn0kpo
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 05:45:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 88CAB8545D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 05:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580795148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=egHlU2U6PFBbVwWy/xLdnjrB42lh1nfso6qhypFl344=;
 b=UC7X4dqBI0uu6eBBP1RmhVjQITEVRkzIoiuYX/Z7mpCvzATRKKmDLpsvKqW4rTSTXWATHf
 XealgE1OsMb9YORk9K9ZfeFrT3n8hShoC/eE+hSv/wsLAd/JwmD8NrjflP8LQy1KW6DSX8
 3t4kq/ADd/NpMEL6/Et6+pXDQ8PYPlU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-aIMrBAAbOpSmTsoNVHIHhA-1; Tue, 04 Feb 2020 00:45:44 -0500
Received: by mail-qv1-f71.google.com with SMTP id g15so11014059qvk.11
 for <virtualization@lists.linux-foundation.org>;
 Mon, 03 Feb 2020 21:45:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=egHlU2U6PFBbVwWy/xLdnjrB42lh1nfso6qhypFl344=;
 b=B6xBEAyUlbYlvsO2LwVDh5oM2k3FLrF05d7ZjILBqDZyT6DBcNARhlYVrg+eDKQsGP
 ut/xMJyjfN29a67daWAyzA284vkPem2WppKv5mz81Xodh8MLAFUGAFxNYUM/0S+TUAZF
 PM4hijAIXwIYal16Dgf1qQJjNKrYghXiF/DBVViUSQ0JX4W6G4NCjt3ZAdkIlZGQ61i4
 MDjIMzdjCVl5wP14RjFqEfKE+zeRDEcFK0Z/VQbIGE7aUnd6ShPx+QkbLataWCfzScZM
 wURI9ue5h9SNJX+ypxBmLvcayhIq97jphhYaUrTE27IlLR74/it9YeqNLpmMHvmNuIpS
 8ENQ==
X-Gm-Message-State: APjAAAVNLpb2IKyEUSrUqSNaw9ZN2my+GD/ugIt7exqXd2tWGKlmYBVI
 T+wZ6RMflMcbL9tnbZje8GyAmJGbhM4xATDqcsIgAsmGdGnTd1nP8t7Qs77dOFhmo1RtfORPNUv
 HDnBahchq33EUAfdJ71Ypez/jem7PiMHKHx/Bg4NIMg==
X-Received: by 2002:ac8:187b:: with SMTP id n56mr27475166qtk.173.1580795143631; 
 Mon, 03 Feb 2020 21:45:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqxRHrFPrkMh9a6LmIqQqRMwZ+W30YdrU5OZ5qv0+GeKOGzk9JeDHM64BA2LhRRKSywft+wsqQ==
X-Received: by 2002:ac8:187b:: with SMTP id n56mr27475153qtk.173.1580795143326; 
 Mon, 03 Feb 2020 21:45:43 -0800 (PST)
Received: from redhat.com (bzq-109-64-11-187.red.bezeqint.net. [109.64.11.187])
 by smtp.gmail.com with ESMTPSA id r13sm10982499qtt.70.2020.02.03.21.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 21:45:42 -0800 (PST)
Date: Tue, 4 Feb 2020 00:45:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Tyler Sanderson <tysand@google.com>
Subject: Re: Balloon pressuring page cache
Message-ID: <20200204004302-mutt-send-email-mst@kernel.org>
References: <91270a68-ff48-88b0-219c-69801f0c252f@redhat.com>
 <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
 <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
 <286AC319A985734F985F78AFA26841F73E3F8A02@shsmsx102.ccr.corp.intel.com>
 <CAJuQAmqcayaNuG19fKCuux=YVO3+VcN-qrXvobgKMykogeMkzA@mail.gmail.com>
 <20200203080520-mutt-send-email-mst@kernel.org>
 <5ac131de8e3b7fc1fafd05a61feb5f6889aeb917.camel@linux.intel.com>
 <c836a8d1-c5cc-eb8b-84ed-027070b77bf8@redhat.com>
 <20200203120225-mutt-send-email-mst@kernel.org>
 <CAJuQAmqGA9mhzR5AQeMDtovJAh7y8khC3qUtLKx_e9RdL0wFJQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJuQAmqGA9mhzR5AQeMDtovJAh7y8khC3qUtLKx_e9RdL0wFJQ@mail.gmail.com>
X-MC-Unique: aIMrBAAbOpSmTsoNVHIHhA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@kernel.org>
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

T24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMTI6MzI6MDVQTSAtMDgwMCwgVHlsZXIgU2FuZGVyc29u
IHdyb3RlOgo+IFRoZXJlIHdlcmUgYXBwYXJlbnRseSBnb29kIHJlYXNvbnMgZm9yIG1vdmluZyBh
d2F5IGZyb20gT09NIG5vdGlmaWVyIGNhbGxiYWNrOgo+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8y
MDE4LzcvMTIvMzE0Cj4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTgvOC8yLzMyMgo+IAo+IElu
IHBhcnRpY3VsYXIgdGhlIE9PTSBub3RpZmllciBpcyB3b3JzZSB0aGFuIHRoZSBzaHJpbmtlciBi
ZWNhdXNlOgo+IAo+ICAxLiBJdCBpcyBsYXN0LXJlc29ydCwgd2hpY2ggbWVhbnMgdGhlIHN5c3Rl
bSBoYXMgYWxyZWFkeSBnb25lIHRocm91Z2ggaGVyb2ljcwo+ICAgICB0byBwcmV2ZW50IE9PTS4g
VGhvc2UgaGVyb2ljIHJlY2xhaW0gZWZmb3J0cyBhcmUgZXhwZW5zaXZlIGFuZCBpbXBhY3QKPiAg
ICAgYXBwbGljYXRpb24gcGVyZm9ybWFuY2UuCj4gIDIuIEl0IGxhY2tzIHVuZGVyc3RhbmRpbmcg
b2YgTlVNQSBvciBvdGhlciBPT00gY29uc3RyYWludHMuCj4gIDMuIEl0IGhhcyBhIGhpZ2hlciBw
b3RlbnRpYWwgZm9yIGJ1Z3MgZHVlIHRvIHRoZSBzdWJ0bGV0ecKgb2YgdGhlIGNhbGxiYWNrCj4g
ICAgIGNvbnRleHQuCj4gCj4gR2l2ZW4gdGhlIGFib3ZlLCBJIHRoaW5rIHRoZSBzaHJpbmtlcsKg
QVBJIGNlcnRhaW5seSBtYWtlcyB0aGUgbW9zdCBzZW5zZSBfaWZfCj4gdGhlIGJhbGxvb24gc2l6
ZSBpcyBzdGF0aWMuIEluIHRoYXQgY2FzZSBtZW1vcnkgc2hvdWxkIGJlIHJlY2xhaW1lZCBmcm9t
IHRoZQo+IGJhbGxvb24gZWFybHkgYW5kIHByb3BvcnRpb25hbGx5IHRvIGJhbGxvb24gc2l6ZSwg
d2hpY2ggdGhlIHNocmlua2VyIEFQSQo+IGFjaGlldmVzLgoKT0sgdGhhdCBzb3VuZHMgbGlrZSBW
SVJUSU9fQkFMTE9PTl9GX0ZSRUVfUEFHRV9ISU5UIHRoZW4uCgo+IEhvd2V2ZXIsIGlmIHRoZSBi
YWxsb29uIGlzIGluZmxhdGluZyBhbmQgaW50ZW50aW9uYWxseSBjYXVzaW5nIG1lbW9yeSBwcmVz
c3VyZQo+IHRoZW4gdGhpcyByZXN1bHRzIGluIHRoZSBpbmVmZmljaWVuY3kgcG9pbnRlZCBvdXQg
ZWFybGllci4KCkFuZCB0aGF0IHNvdW5kcyBsaWtlIFZJUlRJT19CQUxMT09OX0ZfREVGTEFURV9P
Tl9PT00uCgo+IElmIHRoZSBiYWxsb29uIGlzIGluZmxhdGluZyBidXQgbm90IGNhdXNpbmcgbWVt
b3J5IHByZXNzdXJlIHRoZW4gdGhlcmUgaXMgbm8KPiBwcm9ibGVtIHdpdGggZWl0aGVyIEFQSS4K
PiAKPiBUaGlzIHN1Z2dlc3RzIGFub3RoZXIgcm91dGU6IHJhdGhlciB0aGFuIGNhdXNlIG1lbW9y
eSBwcmVzc3VyZSB0byBzaHJpbmsgdGhlCj4gcGFnZSBjYWNoZSwgdGhlIGJhbGxvb24gY291bGQg
aXNzdWUgdGhlIGVxdWl2YWxlbnTCoG9mICJlY2hvIDMgPiAvcHJvYy9zeXMvdm0vCj4gZHJvcF9j
YWNoZXMiLgo+IE9mIGNvdXJzZSBpZGVhbGx5LCB3ZSB3YW50IHRvIGJlIG1vcmUgZmluZSBncmFp
bmVkIHRoYW4gImRyb3AgZXZlcnl0aGluZyIuIFdlCj4gcmVhbGx5IHdhbnQgYW4gQVBJIHRoYXQg
c2F5cyAiZHJvcCBldmVyeXRoaW5nIHRoYXQgaGFzbid0IGJlZW4gYWNjZXNzZWQgaW4gdGhlCj4g
bGFzdCA1IG1pbnV0ZXMiLgo+IAo+IFRoaXMgd291bGQgZWxpbWluYXRlIHRoZSBuZWVkIGZvciB0
aGUgYmFsbG9vbiB0byBjYXVzZSBtZW1vcnkgcHJlc3N1cmUgYXQgYWxsCj4gd2hpY2jCoGF2b2lk
cyB0aGUgaW5lZmZpY2llbmN5IGluIHF1ZXN0aW9uLiBGdXJ0aGVybW9yZSwgdGhpcyBwYWlycyBu
aWNlbHkgd2l0aAo+IHRoZSBGUkVFX1BBR0VfSElOVCBmZWF0dXJlLgoKV2VsbCB3ZSBzdGlsbCBk
byBoYXZlIGEgcmVncmVzc2lvbi4gU28gd2UgcHJvYmFibHkgc2hvdWxkIHJldmVydApmb3Igbm93
LCBhbmQgc2VwYXJhdGVseSBsb29rIGZvciBiZXR0ZXIgc29sdXRpb25zLgoKCgo+IAo+IE9uIE1v
biwgRmViIDMsIDIwMjAgYXQgOTowNCBBTSBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQu
Y29tPiB3cm90ZToKPiAKPiAgICAgT24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDU6MzQ6MjBQTSAr
MDEwMCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gICAgID4gT24gMDMuMDIuMjAgMTc6MTgs
IEFsZXhhbmRlciBEdXljayB3cm90ZToKPiAgICAgPiA+IE9uIE1vbiwgMjAyMC0wMi0wMyBhdCAw
ODoxMSAtMDUwMCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+ICAgICA+ID4+IE9uIFRodSwg
SmFuIDMwLCAyMDIwIGF0IDExOjU5OjQ2QU0gLTA4MDAsIFR5bGVyIFNhbmRlcnNvbiB3cm90ZToK
PiAgICAgPiA+Pj4KPiAgICAgPiA+Pj4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgNzozMSBBTSBX
YW5nLCBXZWkgVyA8d2VpLncud2FuZ0BpbnRlbC5jb20+Cj4gICAgIHdyb3RlOgo+ICAgICA+ID4+
Pgo+ICAgICA+ID4+PsKgIMKgIMKgT24gVGh1cnNkYXksIEphbnVhcnkgMzAsIDIwMjAgMTE6MDMg
UE0sIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+ICAgICA+ID4+PsKgIMKgIMKgPiBPbiAyOS4w
MS4yMCAyMDoxMSwgVHlsZXIgU2FuZGVyc29uIHdyb3RlOgo+ICAgICA+ID4+PsKgIMKgIMKgPiA+
Cj4gICAgID4gPj4+wqAgwqAgwqA+ID4KPiAgICAgPiA+Pj7CoCDCoCDCoD4gPiBPbiBXZWQsIEph
biAyOSwgMjAyMCBhdCAyOjMxIEFNIERhdmlkIEhpbGRlbmJyYW5kIDwKPiAgICAgZGF2aWRAcmVk
aGF0LmNvbQo+ICAgICA+ID4+PsKgIMKgIMKgPiA+IDxtYWlsdG86ZGF2aWRAcmVkaGF0LmNvbT4+
IHdyb3RlOgo+ICAgICA+ID4+PsKgIMKgIMKgPiA+Cj4gICAgID4gPj4+wqAgwqAgwqA+ID7CoCDC
oCDCoE9uIDI5LjAxLjIwIDAxOjIyLCBUeWxlciBTYW5kZXJzb24gdmlhIFZpcnR1YWxpemF0aW9u
Cj4gICAgIHdyb3RlOgo+ICAgICA+ID4+PsKgIMKgIMKgPiA+wqAgwqAgwqA+IEEgcHJpbWFyeSBh
ZHZhbnRhZ2Ugb2YgdmlydGlvIGJhbGxvb24gb3ZlciBvdGhlciBtZW1vcnkKPiAgICAgcmVjbGFp
bQo+ICAgICA+ID4+PsKgIMKgIMKgPiA+wqAgwqAgwqA+IG1lY2hhbmlzbXMgaXMgdGhhdCBpdCBj
YW4gcHJlc3N1cmUgdGhlIGd1ZXN0J3MgcGFnZQo+ICAgICBjYWNoZSBpbnRvCj4gICAgID4gPj4+
wqAgwqAgwqA+ID7CoCDCoCDCoHNocmlua2luZy4KPiAgICAgPiA+Pj7CoCDCoCDCoD4gPsKgIMKg
IMKgPgo+ICAgICA+ID4+PsKgIMKgIMKgPiA+wqAgwqAgwqA+IEhvd2V2ZXIsIHNpbmNlIHRoZSBi
YWxsb29uIGRyaXZlciBjaGFuZ2VkIHRvIHVzaW5nIHRoZQo+ICAgICBzaHJpbmtlcgo+ICAgICA+
ID4+PsKgIMKgIMKgQVBJCj4gICAgID4gPj4+wqAgwqAgwqA+ID7CoCDCoCDCoD4KPiAgICAgPiA+
Pj7CoCDCoCDCoD4gPgo+ICAgICA+ID4+PsKgIMKgIMKgPiA8aHR0cHM6Ly9naXRodWIuY29tL3Rv
cnZhbGRzL2xpbnV4L2NvbW1pdC8KPiAgICAgNzE5OTQ2MjBiYjI1YThiMTA5Mzg4ZmVmYTkKPiAg
ICAgPiA+Pj7CoCDCoCDCoD4gZTk5YTI4ZTM1NTI1NWEjZGlmZi1mZDIwMmFjZjY5NGQ5ZWJhMTlj
OGM2NGRhM2U0ODBjOT4gdGhpcwo+ICAgICA+ID4+PsKgIMKgIMKgPiA+wqAgwqAgwqA+IHVzZSBj
YXNlIGhhcyBiZWNvbWUgYSBiaXQgbW9yZSB0cmlja3kuIEknbSB3b25kZXJpbmcKPiAgICAgd2hh
dCB0aGUKPiAgICAgPiA+Pj7CoCDCoCDCoD4gaW50ZW5kZWQKPiAgICAgPiA+Pj7CoCDCoCDCoD4g
PsKgIMKgIMKgPiBkZXZpY2UgaW1wbGVtZW50YXRpb24gaXMuCj4gICAgID4gPj4+wqAgwqAgwqA+
ID7CoCDCoCDCoD4KPiAgICAgPiA+Pj7CoCDCoCDCoD4gPsKgIMKgIMKgPiBXaGVuIGluZmxhdGlu
ZyB0aGUgYmFsbG9vbiBhZ2FpbnN0IHBhZ2UgY2FjaGUgKGkuZS4gbm8KPiAgICAgZnJlZQo+ICAg
ICA+ID4+PsKgIMKgIMKgbWVtb3J5Cj4gICAgID4gPj4+wqAgwqAgwqA+ID7CoCDCoCDCoD4gcmVt
YWlucykgdm1zY2FuLmMgd2lsbCBib3RoIHNocmluayBwYWdlIGNhY2hlLCBidXQgYWxzbwo+ICAg
ICBpbnZva2UKPiAgICAgPiA+Pj7CoCDCoCDCoHRoZQo+ICAgICA+ID4+PsKgIMKgIMKgPiA+wqAg
wqAgwqA+IHNocmlua2VycyAtLSBpbmNsdWRpbmcgdGhlIGJhbGxvb24ncyBzaHJpbmtlci4gU28g
dGhlCj4gICAgIGJhbGxvb24KPiAgICAgPiA+Pj7CoCDCoCDCoGRyaXZlcgo+ICAgICA+ID4+PsKg
IMKgIMKgPiA+wqAgwqAgwqA+IGFsbG9jYXRlcyBtZW1vcnkgd2hpY2ggcmVxdWlyZXMgcmVjbGFp
bSwgdm1zY2FuIGdldHMKPiAgICAgdGhpcyBtZW1vcnkKPiAgICAgPiA+Pj7CoCDCoCDCoD4gYnkK
PiAgICAgPiA+Pj7CoCDCoCDCoD4gPsKgIMKgIMKgPiBzaHJpbmtpbmcgdGhlIGJhbGxvb24sIGFu
ZCB0aGVuIHRoZSBkcml2ZXIgYWRkcyB0aGUKPiAgICAgbWVtb3J5IGJhY2sKPiAgICAgPiA+Pj7C
oCDCoCDCoHRvCj4gICAgID4gPj4+wqAgwqAgwqA+IHRoZQo+ICAgICA+ID4+PsKgIMKgIMKgPiA+
wqAgwqAgwqA+IGJhbGxvb24uIEJhc2ljYWxseSBhIGJ1c3kgbm8tb3AuCj4gICAgID4gPj4+Cj4g
ICAgID4gPj4+wqAgwqAgwqBQZXIgbXkgdW5kZXJzdGFuZGluZywgdGhlIGJhbGxvb24gYWxsb2Nh
dGlvbiB3b27igJl0IGludm9rZQo+ICAgICBzaHJpbmtlciBhcwo+ICAgICA+ID4+PsKgIMKgIMKg
X19HRlBfRElSRUNUX1JFQ0xBSU0gaXNuJ3Qgc2V0LCBubz8KPiAgICAgPiA+Pj4KPiAgICAgPiA+
Pj4gSSBjb3VsZCBiZSB3cm9uZyBhYm91dCB0aGUgbWVjaGFuaXNtLCBidXQgdGhlIGRldmljZSBz
ZWVzIGxvdHMgb2YKPiAgICAgYWN0aXZpdHkgb24KPiAgICAgPiA+Pj4gdGhlIGRlZmxhdGUgcXVl
dWUuIFRoZSBiYWxsb29uIGlzIGJlaW5nIHNocnVuay4gQW5kIHRoaXMgb25seSBzdGFydHMKPiAg
ICAgb25jZSBhbGwKPiAgICAgPiA+Pj4gZnJlZSBtZW1vcnkgaXMgZGVwbGV0ZWQgYW5kIHdlJ3Jl
IGluZmxhdGluZyBpbnRvIHBhZ2UgY2FjaGUuCj4gICAgID4gPj4KPiAgICAgPiA+PiBTbyBnaXZl
biB0aGlzIGxvb2tzIGxpa2UgYSByZWdyZXNzaW9uLCBtYXliZSB3ZSBzaG91bGQgcmV2ZXJ0IHRo
ZQo+ICAgICA+ID4+IHBhdGNoIGluIHF1ZXN0aW9uIDcxOTk0NjIwYmIyNSAoInZpcnRpb19iYWxs
b29uOiByZXBsYWNlIG9vbSBub3RpZmllcgo+ICAgICB3aXRoIHNocmlua2VyIikKPiAgICAgPiA+
PiBCZXNpZGVzLCB3aXRoIFZJUlRJT19CQUxMT09OX0ZfRlJFRV9QQUdFX0hJTlQKPiAgICAgPiA+
PiBzaHJpbmtlciBhbHNvIGlnbm9yZXMgVklSVElPX0JBTExPT05fRl9NVVNUX1RFTExfSE9TVCB3
aGljaCBpc24ndCBuaWNlCj4gICAgID4gPj4gYXQgYWxsLgo+ICAgICA+ID4+Cj4gICAgID4gPj4g
U28gaXQgbG9va3MgbGlrZSBhbGwgdGhpcyByZXdvcmsgaW50cm9kdWNlZCBtb3JlIGlzc3VlcyB0
aGFuIGl0Cj4gICAgID4gPj4gYWRkcmVzc2VkIC4uLgo+ICAgICA+ID4+Cj4gICAgID4gPj4gSSBh
bHNvIENDIEFsZXggRHV5Y2sgZm9yIGFuIG9waW5pb24gb24gdGhpcy4KPiAgICAgPiA+PiBBbGV4
LCB3aGF0IGRvIHlvdSB1c2UgdG8gcHV0IHByZXNzdXJlIG9uIHBhZ2UgY2FjaGU/Cj4gICAgID4g
Pgo+ICAgICA+ID4gSSB3b3VsZCBzYXkgcmV2ZXJ0aW5nIHByb2JhYmx5IG1ha2VzIHNlbnNlLiBJ
J20gbm90IHN1cmUgdGhlcmUgaXMgbXVjaAo+ICAgICA+ID4gdmFsdWUgdG8gaGF2aW5nIGEgc2hy
aW5rZXIgcnVubmluZyBkZWZsYXRpb24gd2hlbiB5b3UgYXJlIGFjdGl2ZWx5Cj4gICAgIHRyeWlu
Zwo+ICAgICA+ID4gdG8gaW5jcmVhc2UgdGhlIGJhbGxvb24uIEl0IHdvdWxkIG1ha2UgbW9yZSBz
ZW5zZSB0byB3YWl0IHVudGlsIHlvdSBhcmUKPiAgICAgPiA+IGFjdHVhbGx5IGFib3V0IHRvIHN0
YXJ0IGhpdHRpbmcgb29tLgo+ICAgICA+Cj4gICAgID4gSSB0aGluayB0aGUgc2hyaW5rZXIgbWFr
ZXMgc2Vuc2UgZm9yIGZyZWUgcGFnZSBoaW50aW5nIGZlYXR1cmUKPiAgICAgPiAoZXZlcnl0aGlu
ZyBvbiBmcmVlX3BhZ2VfbGlzdCkuCj4gICAgID4KPiAgICAgPiBTbyBpbnN0ZWFkIG9mIG9ubHkg
cmV2ZXJ0aW5nLCBJIHRoaW5rIHdlIHNob3VsZCBzcGxpdCBpdCB1cCBhbmQgYWx3YXlzCj4gICAg
ID4gcmVnaXN0ZXIgdGhlIHNocmlua2VyIGZvciBWSVJUSU9fQkFMTE9PTl9GX0ZSRUVfUEFHRV9I
SU5UIGFuZCB0aGUgT09NCj4gICAgID4gbm90aWZpZXIgKGFzIGJlZm9yZSkgZm9yIFZJUlRJT19C
QUxMT09OX0ZfTVVTVF9URUxMX0hPU1QuCj4gCj4gICAgIE9LIC4uLiBJIGd1ZXNzIHRoYXQgbWVh
bnMgd2UgbmVlZCB0byBmaXggc2hyaW5rZXIgdG8gdGFrZQo+ICAgICBWSVJUSU9fQkFMTE9PTl9G
X01VU1RfVEVMTF9IT1NUIGludG8gYWNjb3VudCBjb3JyZWN0bHkuCj4gICAgIEhvc3RzIGlnbm9y
ZSBpdCBhdCB0aGUgbW9tZW50IGJ1dCBpdCdzIGEgZnJhZ2lsZSB0aGluZwo+ICAgICB0byBkbyB3
aGF0IGl0IGRvZXMgYW5kIGlnbm9yZSB1c2VkIGJ1ZmZlcnMuCj4gCj4gICAgID4gKE9mIGNvdXJz
ZSwgYWRhcHRpbmcgd2hhdCBpcyBiZWluZyBkb25lIGluIHRoZSBzaHJpbmtlciBhbmQgaW4gdGhl
IE9PTQo+ICAgICA+IG5vdGlmaWVyKQo+ICAgICA+Cj4gICAgID4gLS0KPiAgICAgPiBUaGFua3Ms
Cj4gICAgID4KPiAgICAgPiBEYXZpZCAvIGRoaWxkZW5iCj4gCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
