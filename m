Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CED41520ED
	for <lists.virtualization@lfdr.de>; Tue,  4 Feb 2020 20:17:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B4D4B86D88;
	Tue,  4 Feb 2020 19:17:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A2gernPFStqP; Tue,  4 Feb 2020 19:17:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2313586E64;
	Tue,  4 Feb 2020 19:17:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4850C0174;
	Tue,  4 Feb 2020 19:17:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 750B6C0174
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 19:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6339E86D88
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 19:17:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ed2GwnfowWZ
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 19:17:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 76AEF86C1D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 19:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580843847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JwYkuIMKsPMWepiRSh4HrO3lD9ztu36BpmIWO918fRE=;
 b=I9AMTXnjAUZqoQAPWJrRzKnwU/sNTav0rOsfN/hFmwqQ1Q/XAQ1oTtvIsgXSaOn3VQeW9Q
 s7ZrwuNuVGp2HWyKq11/odmOeW15+xFgW+3xCfQwRcHvEUPTHLtsflufCzVyKW+x9ziJPY
 4oRILy4WN5kdY1yFxYYD5gw18Xm7gr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-ZgY59qkDOqWXkyd0DG3Tyg-1; Tue, 04 Feb 2020 14:17:25 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA28E800D5C;
 Tue,  4 Feb 2020 19:17:23 +0000 (UTC)
Received: from [10.36.116.24] (ovpn-116-24.ams2.redhat.com [10.36.116.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 279CC5DA7D;
 Tue,  4 Feb 2020 19:17:18 +0000 (UTC)
Subject: Re: Balloon pressuring page cache
To: Tyler Sanderson <tysand@google.com>
References: <CAJuQAmpDUyve2S+oxp9tLUhuRcnddXnNztC5PmYOOCpY6c68xg@mail.gmail.com>
 <91270a68-ff48-88b0-219c-69801f0c252f@redhat.com>
 <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
 <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
 <286AC319A985734F985F78AFA26841F73E3F8A02@shsmsx102.ccr.corp.intel.com>
 <CAJuQAmqcayaNuG19fKCuux=YVO3+VcN-qrXvobgKMykogeMkzA@mail.gmail.com>
 <20200203080520-mutt-send-email-mst@kernel.org>
 <5ac131de8e3b7fc1fafd05a61feb5f6889aeb917.camel@linux.intel.com>
 <c836a8d1-c5cc-eb8b-84ed-027070b77bf8@redhat.com>
 <20200203120225-mutt-send-email-mst@kernel.org>
 <CAJuQAmqGA9mhzR5AQeMDtovJAh7y8khC3qUtLKx_e9RdL0wFJQ@mail.gmail.com>
 <74cc25a6-cefb-c580-8e59-5b76fb680bf4@redhat.com>
 <CAJuQAmpiVqnNt-vSkQh5Gg63QZ49_nuz4+VW2Jfwn51gWVdtfA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <b809340d-7e86-caf6-bf12-db7bb8265045@redhat.com>
Date: Tue, 4 Feb 2020 20:17:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAJuQAmpiVqnNt-vSkQh5Gg63QZ49_nuz4+VW2Jfwn51gWVdtfA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: ZgY59qkDOqWXkyd0DG3Tyg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, namit@vmware.com,
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

T24gMDQuMDIuMjAgMTk6NTIsIFR5bGVyIFNhbmRlcnNvbiB3cm90ZToKPiAKPiAKPiBPbiBUdWUs
IEZlYiA0LCAyMDIwIGF0IDEyOjI5IEFNIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQu
Y29tCj4gPG1haWx0bzpkYXZpZEByZWRoYXQuY29tPj4gd3JvdGU6Cj4gCj4gICAgIE9uIDAzLjAy
LjIwIDIxOjMyLCBUeWxlciBTYW5kZXJzb24gd3JvdGU6Cj4gICAgID4gVGhlcmUgd2VyZSBhcHBh
cmVudGx5IGdvb2QgcmVhc29ucyBmb3IgbW92aW5nIGF3YXkgZnJvbSBPT00gbm90aWZpZXIKPiAg
ICAgPiBjYWxsYmFjazoKPiAgICAgPiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOC83LzEyLzMx
NAo+ICAgICA+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE4LzgvMi8zMjIKPiAgICAgPgo+ICAg
ICA+IEluIHBhcnRpY3VsYXIgdGhlIE9PTSBub3RpZmllciBpcyB3b3JzZSB0aGFuIHRoZSBzaHJp
bmtlciBiZWNhdXNlOgo+IAo+ICAgICBUaGUgaXNzdWUgaXMgdGhhdCBERUZMQVRFX09OX09PTSBp
cyB1bmRlci1zcGVjaWZpZWQuCj4gCj4gICAgID4KPiAgICAgPsKgIDEuIEl0IGlzIGxhc3QtcmVz
b3J0LCB3aGljaCBtZWFucyB0aGUgc3lzdGVtIGhhcyBhbHJlYWR5IGdvbmUgdGhyb3VnaAo+ICAg
ICA+wqAgwqAgwqBoZXJvaWNzIHRvIHByZXZlbnQgT09NLiBUaG9zZSBoZXJvaWMgcmVjbGFpbSBl
ZmZvcnRzIGFyZSBleHBlbnNpdmUKPiAgICAgPsKgIMKgIMKgYW5kIGltcGFjdCBhcHBsaWNhdGlv
biBwZXJmb3JtYW5jZS4KPiAKPiAgICAgVGhhdCdzICpleGFjdGx5KiB3aGF0ICJkZWZsYXRlIG9u
IE9PTSIgc3VnZ2VzdHMuCj4gCj4gCj4gSXQgc2VlbXMgdGhlcmUgYXJlIHNvbWUgdXNlIGNhc2Vz
IHdoZXJlICJkZWZsYXRlIG9uIE9PTSIgaXMgZGVzaXJlZCBhbmQKPiBvdGhlcnMgd2hlcmUgImRl
ZmxhdGUgb24gcHJlc3N1cmUiIGlzIGRlc2lyZWQuCj4gVGhpcyBzdWdnZXN0cyBhZGRpbmcgYSBu
ZXcgZmVhdHVyZSBiaXQgIkRFRkxBVEVfT05fUFJFU1NVUkUiIHRoYXQKPiByZWdpc3RlcnMgdGhl
IHNocmlua2VyLCBhbmQgcmV2ZXJ0aW5nIERFRkxBVEVfT05fT09NIHRvIHVzZSB0aGUgT09NCj4g
bm90aWZpZXIgY2FsbGJhY2suCj4gCj4gVGhpcyBsZXRzIHVzZXJzIGNvbmZpZ3VyZSB0aGUgYmFs
bG9vbiBmb3IgdGhlaXIgdXNlIGNhc2UuCgpZb3Ugd2FudCB0aGUgb2xkIGJlaGF2aW9yIGJhY2ss
IHNvIHdoeSBzaG91bGQgd2UgaW50cm9kdWNlIGEgbmV3IG9uZT8gT3IKYW0gSSBtaXNzaW5nIHNv
bWV0aGluZz8gKHlvdSBkaWQgd2FudCB1cyB0byByZXZlcnQgdG8gb2xkIGhhbmRsaW5nLCBubz8p
CgpJIGNvbnNpZGVyIHZpcnRpby1iYWxsb29uIHRvIHRoaXMgdmVyeSBkYXkgYSBiaWcgaGFjay4g
QW5kIEkgZG9uJ3Qgc2VlCml0IGdldHRpbmcgYmV0dGVyIHdpdGggbmV3IGNvbmZpZyBrbm9icy4g
SGF2aW5nIHRoYXQgc2FpZCwgdGhlCnRlY2hub2xvZ2llcyB0aGF0IGFyZSBjYW5kaWRhdGVzIHRv
IHJlcGxhY2UgaXQgKGZyZWUgcGFnZSByZXBvcnRpbmcsCnRhbWluZyB0aGUgZ3Vlc3QgcGFnZSBj
YWNoZSwgZXRjLikgYXJlIHN0aWxsIG5vdCByZWFkeSAtIHNvIHdlJ2xsIGhhdmUKdG8gc3RpY2sg
d2l0aCBpdCBmb3Igbm93IDooIC4KCj4gCj4gSSdtIGFjdHVhbGx5IG5vdCBzdXJlIGhvdyB5b3Ug
d291bGQgc2FmZWx5IGRvIG1lbW9yeSBvdmVyY29tbWl0IHdpdGhvdXQKPiBERUZMQVRFX09OX09P
TS4gU28gSSB0aGluayBpdCB1bmxvY2tzIGEgaHVnZSB1c2UgY2FzZS4KClVzaW5nIGJldHRlciBz
dWl0ZWQgdGVjaG5vbG9naWVzIHRoYXQgYXJlIG5vdCByZWFkeSB5ZXQgKHdlbGwsIHNvbWUgZm9y
bQpvZiBmcmVlIHBhZ2UgcmVwb3J0aW5nIGlzIGF2YWlsYWJsZSB1bmRlciBJQk0geiBhbHJlYWR5
IGJ1dCBpbiBhCnByb3ByaWV0YXJ5IGZvcm0pIDspIEFueWhvdywgSSByZW1lbWJlciB0aGF0IERF
RkxBVEVfT05fT09NIG9ubHkgbWFrZXMKaXQgbGVzcyBsaWtlbHkgdG8gY3Jhc2ggeW91ciBndWVz
dCwgYnV0IG5vdCB0aGF0IHlvdSBhcmUgc2FmZSB0byBzcXVlZXplCnRoZSBsYXN0IGJpdCBvdXQg
b2YgeW91ciBndWVzdCBWTS4KCi0tIApUaGFua3MsCgpEYXZpZCAvIGRoaWxkZW5iCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
