Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AF9150E4D
	for <lists.virtualization@lfdr.de>; Mon,  3 Feb 2020 18:04:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5F35881E39;
	Mon,  3 Feb 2020 17:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sQyJ2pXdu8Xy; Mon,  3 Feb 2020 17:04:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5E46081B8A;
	Mon,  3 Feb 2020 17:04:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 381B2C1D81;
	Mon,  3 Feb 2020 17:04:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F6F0C0174
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 17:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8CB0E87463
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 17:04:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wJ3RokIkqqpo
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 17:04:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3C89E8753D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 17:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580749459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y44gayMdvWxI/WSWNYy85+9/6qvmbHxSyq8pt+fDbBA=;
 b=EQ/EguyvIai/u8KmujbRyOV9k82iKrQhkH0nHs/4kZsT/8j1RCrPJ+bcvF15NMBNULGyS6
 V1Tg7LhsmX5TXPrxSUfZNTp4A/ffkj/Id3nEGElX0egbKjocBhrWL3nizjCYBLlq5qIWvz
 2PSiFPh3yzQiWUVzan7BVh+z/Mg2Uz0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-fD54ttGBPxmvc81HnZ-mnA-1; Mon, 03 Feb 2020 12:04:02 -0500
Received: by mail-qt1-f200.google.com with SMTP id d16so1853501qtr.2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 03 Feb 2020 09:04:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Y44gayMdvWxI/WSWNYy85+9/6qvmbHxSyq8pt+fDbBA=;
 b=maEXKDHlgW6TrbtsXCirDV4kaE7HkJuHAVCYjIFS9MP7ux5wWDtwQFNG/S2tluRIZy
 IFGDWms7DZuMh7tUTJ3ab5dKlDKSiugA9ioT33C5ZHDLdl9//n4yt7kcPbGxXd9/gWzo
 g3SD8ygwlsOtL6avsd7SlvWUgEUrpofSyVw6gjF2jQM73QReRX7tEwVwpNRRcRQ/n9AY
 LlJPw5igQJL4iE/SyJqs2IYtSGgXEmYdFlAinFY0u83bWJ+80Q6hFkR0ZWuVyAJGT8o3
 q1vDADSB98yTeI7fhCEJhkkB6+hmdRSVlm6yQgfDnkYyqZewqsPC+CTbQiTpL5IClyKI
 Vt8w==
X-Gm-Message-State: APjAAAWWBxPCwjfWqQDy130rzHnigbEiMhO40FYqkrUflTZIDgQQChbP
 bMVOD4jBL4D1GKnfv5AVSzfhqhu98vAQXOynRl+TFYKd8cRaH/YSsq+4G9jINNgq0D6PD5YGcMn
 BFPd4Cvm3AeeKbecyoBvfEMYZUupV8zmNGKAfNNRFcg==
X-Received: by 2002:a37:9dc8:: with SMTP id
 g191mr24371862qke.171.1580749442457; 
 Mon, 03 Feb 2020 09:04:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqziT6dDdzBZ5/VpRxQBOrjZwjAcJQbt0FjvLNXCg1NJioS7wYmUvlg7/2Y1knb3p3SASCDaxg==
X-Received: by 2002:a37:9dc8:: with SMTP id
 g191mr24371833qke.171.1580749442075; 
 Mon, 03 Feb 2020 09:04:02 -0800 (PST)
Received: from redhat.com (bzq-109-64-11-187.red.bezeqint.net. [109.64.11.187])
 by smtp.gmail.com with ESMTPSA id c186sm3870988qke.124.2020.02.03.09.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 09:04:01 -0800 (PST)
Date: Mon, 3 Feb 2020 12:03:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: Balloon pressuring page cache
Message-ID: <20200203120225-mutt-send-email-mst@kernel.org>
References: <CAJuQAmpDUyve2S+oxp9tLUhuRcnddXnNztC5PmYOOCpY6c68xg@mail.gmail.com>
 <91270a68-ff48-88b0-219c-69801f0c252f@redhat.com>
 <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
 <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
 <286AC319A985734F985F78AFA26841F73E3F8A02@shsmsx102.ccr.corp.intel.com>
 <CAJuQAmqcayaNuG19fKCuux=YVO3+VcN-qrXvobgKMykogeMkzA@mail.gmail.com>
 <20200203080520-mutt-send-email-mst@kernel.org>
 <5ac131de8e3b7fc1fafd05a61feb5f6889aeb917.camel@linux.intel.com>
 <c836a8d1-c5cc-eb8b-84ed-027070b77bf8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c836a8d1-c5cc-eb8b-84ed-027070b77bf8@redhat.com>
X-MC-Unique: fD54ttGBPxmvc81HnZ-mnA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Tyler Sanderson <tysand@google.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
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

T24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDU6MzQ6MjBQTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gT24gMDMuMDIuMjAgMTc6MTgsIEFsZXhhbmRlciBEdXljayB3cm90ZToKPiA+
IE9uIE1vbiwgMjAyMC0wMi0wMyBhdCAwODoxMSAtMDUwMCwgTWljaGFlbCBTLiBUc2lya2luIHdy
b3RlOgo+ID4+IE9uIFRodSwgSmFuIDMwLCAyMDIwIGF0IDExOjU5OjQ2QU0gLTA4MDAsIFR5bGVy
IFNhbmRlcnNvbiB3cm90ZToKPiA+Pj4KPiA+Pj4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgNzoz
MSBBTSBXYW5nLCBXZWkgVyA8d2VpLncud2FuZ0BpbnRlbC5jb20+IHdyb3RlOgo+ID4+Pgo+ID4+
PiAgICAgT24gVGh1cnNkYXksIEphbnVhcnkgMzAsIDIwMjAgMTE6MDMgUE0sIERhdmlkIEhpbGRl
bmJyYW5kIHdyb3RlOgo+ID4+PiAgICAgPiBPbiAyOS4wMS4yMCAyMDoxMSwgVHlsZXIgU2FuZGVy
c29uIHdyb3RlOgo+ID4+PiAgICAgPiA+Cj4gPj4+ICAgICA+ID4KPiA+Pj4gICAgID4gPiBPbiBX
ZWQsIEphbiAyOSwgMjAyMCBhdCAyOjMxIEFNIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRo
YXQuY29tCj4gPj4+ICAgICA+ID4gPG1haWx0bzpkYXZpZEByZWRoYXQuY29tPj4gd3JvdGU6Cj4g
Pj4+ICAgICA+ID4KPiA+Pj4gICAgID4gPiAgICAgT24gMjkuMDEuMjAgMDE6MjIsIFR5bGVyIFNh
bmRlcnNvbiB2aWEgVmlydHVhbGl6YXRpb24gd3JvdGU6Cj4gPj4+ICAgICA+ID4gICAgID4gQSBw
cmltYXJ5IGFkdmFudGFnZSBvZiB2aXJ0aW8gYmFsbG9vbiBvdmVyIG90aGVyIG1lbW9yeSByZWNs
YWltCj4gPj4+ICAgICA+ID4gICAgID4gbWVjaGFuaXNtcyBpcyB0aGF0IGl0IGNhbiBwcmVzc3Vy
ZSB0aGUgZ3Vlc3QncyBwYWdlIGNhY2hlIGludG8KPiA+Pj4gICAgID4gPiAgICAgc2hyaW5raW5n
Lgo+ID4+PiAgICAgPiA+ICAgICA+Cj4gPj4+ICAgICA+ID4gICAgID4gSG93ZXZlciwgc2luY2Ug
dGhlIGJhbGxvb24gZHJpdmVyIGNoYW5nZWQgdG8gdXNpbmcgdGhlIHNocmlua2VyCj4gPj4+ICAg
ICBBUEkKPiA+Pj4gICAgID4gPiAgICAgPgo+ID4+PiAgICAgPiA+Cj4gPj4+ICAgICA+IDxodHRw
czovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0LzcxOTk0NjIwYmIyNWE4YjEwOTM4
OGZlZmE5Cj4gPj4+ICAgICA+IGU5OWEyOGUzNTUyNTVhI2RpZmYtZmQyMDJhY2Y2OTRkOWViYTE5
YzhjNjRkYTNlNDgwYzk+IHRoaXMKPiA+Pj4gICAgID4gPiAgICAgPiB1c2UgY2FzZSBoYXMgYmVj
b21lIGEgYml0IG1vcmUgdHJpY2t5LiBJJ20gd29uZGVyaW5nIHdoYXQgdGhlCj4gPj4+ICAgICA+
IGludGVuZGVkCj4gPj4+ICAgICA+ID4gICAgID4gZGV2aWNlIGltcGxlbWVudGF0aW9uIGlzLgo+
ID4+PiAgICAgPiA+ICAgICA+Cj4gPj4+ICAgICA+ID4gICAgID4gV2hlbiBpbmZsYXRpbmcgdGhl
IGJhbGxvb24gYWdhaW5zdCBwYWdlIGNhY2hlIChpLmUuIG5vIGZyZWUKPiA+Pj4gICAgIG1lbW9y
eQo+ID4+PiAgICAgPiA+ICAgICA+IHJlbWFpbnMpIHZtc2Nhbi5jIHdpbGwgYm90aCBzaHJpbmsg
cGFnZSBjYWNoZSwgYnV0IGFsc28gaW52b2tlCj4gPj4+ICAgICB0aGUKPiA+Pj4gICAgID4gPiAg
ICAgPiBzaHJpbmtlcnMgLS0gaW5jbHVkaW5nIHRoZSBiYWxsb29uJ3Mgc2hyaW5rZXIuIFNvIHRo
ZSBiYWxsb29uCj4gPj4+ICAgICBkcml2ZXIKPiA+Pj4gICAgID4gPiAgICAgPiBhbGxvY2F0ZXMg
bWVtb3J5IHdoaWNoIHJlcXVpcmVzIHJlY2xhaW0sIHZtc2NhbiBnZXRzIHRoaXMgbWVtb3J5Cj4g
Pj4+ICAgICA+IGJ5Cj4gPj4+ICAgICA+ID4gICAgID4gc2hyaW5raW5nIHRoZSBiYWxsb29uLCBh
bmQgdGhlbiB0aGUgZHJpdmVyIGFkZHMgdGhlIG1lbW9yeSBiYWNrCj4gPj4+ICAgICB0bwo+ID4+
PiAgICAgPiB0aGUKPiA+Pj4gICAgID4gPiAgICAgPiBiYWxsb29uLiBCYXNpY2FsbHkgYSBidXN5
IG5vLW9wLgo+ID4+Pgo+ID4+PiAgICAgUGVyIG15IHVuZGVyc3RhbmRpbmcsIHRoZSBiYWxsb29u
IGFsbG9jYXRpb24gd29u4oCZdCBpbnZva2Ugc2hyaW5rZXIgYXMKPiA+Pj4gICAgIF9fR0ZQX0RJ
UkVDVF9SRUNMQUlNIGlzbid0IHNldCwgbm8/Cj4gPj4+Cj4gPj4+IEkgY291bGQgYmUgd3Jvbmcg
YWJvdXQgdGhlIG1lY2hhbmlzbSwgYnV0IHRoZSBkZXZpY2Ugc2VlcyBsb3RzIG9mIGFjdGl2aXR5
IG9uCj4gPj4+IHRoZSBkZWZsYXRlIHF1ZXVlLiBUaGUgYmFsbG9vbiBpcyBiZWluZyBzaHJ1bmsu
IEFuZCB0aGlzIG9ubHkgc3RhcnRzIG9uY2UgYWxsCj4gPj4+IGZyZWUgbWVtb3J5IGlzIGRlcGxl
dGVkIGFuZCB3ZSdyZSBpbmZsYXRpbmcgaW50byBwYWdlIGNhY2hlLgo+ID4+Cj4gPj4gU28gZ2l2
ZW4gdGhpcyBsb29rcyBsaWtlIGEgcmVncmVzc2lvbiwgbWF5YmUgd2Ugc2hvdWxkIHJldmVydCB0
aGUKPiA+PiBwYXRjaCBpbiBxdWVzdGlvbiA3MTk5NDYyMGJiMjUgKCJ2aXJ0aW9fYmFsbG9vbjog
cmVwbGFjZSBvb20gbm90aWZpZXIgd2l0aCBzaHJpbmtlciIpCj4gPj4gQmVzaWRlcywgd2l0aCBW
SVJUSU9fQkFMTE9PTl9GX0ZSRUVfUEFHRV9ISU5UCj4gPj4gc2hyaW5rZXIgYWxzbyBpZ25vcmVz
IFZJUlRJT19CQUxMT09OX0ZfTVVTVF9URUxMX0hPU1Qgd2hpY2ggaXNuJ3QgbmljZQo+ID4+IGF0
IGFsbC4KPiA+Pgo+ID4+IFNvIGl0IGxvb2tzIGxpa2UgYWxsIHRoaXMgcmV3b3JrIGludHJvZHVj
ZWQgbW9yZSBpc3N1ZXMgdGhhbiBpdAo+ID4+IGFkZHJlc3NlZCAuLi4KPiA+Pgo+ID4+IEkgYWxz
byBDQyBBbGV4IER1eWNrIGZvciBhbiBvcGluaW9uIG9uIHRoaXMuCj4gPj4gQWxleCwgd2hhdCBk
byB5b3UgdXNlIHRvIHB1dCBwcmVzc3VyZSBvbiBwYWdlIGNhY2hlPwo+ID4gCj4gPiBJIHdvdWxk
IHNheSByZXZlcnRpbmcgcHJvYmFibHkgbWFrZXMgc2Vuc2UuIEknbSBub3Qgc3VyZSB0aGVyZSBp
cyBtdWNoCj4gPiB2YWx1ZSB0byBoYXZpbmcgYSBzaHJpbmtlciBydW5uaW5nIGRlZmxhdGlvbiB3
aGVuIHlvdSBhcmUgYWN0aXZlbHkgdHJ5aW5nCj4gPiB0byBpbmNyZWFzZSB0aGUgYmFsbG9vbi4g
SXQgd291bGQgbWFrZSBtb3JlIHNlbnNlIHRvIHdhaXQgdW50aWwgeW91IGFyZQo+ID4gYWN0dWFs
bHkgYWJvdXQgdG8gc3RhcnQgaGl0dGluZyBvb20uCj4gCj4gSSB0aGluayB0aGUgc2hyaW5rZXIg
bWFrZXMgc2Vuc2UgZm9yIGZyZWUgcGFnZSBoaW50aW5nIGZlYXR1cmUKPiAoZXZlcnl0aGluZyBv
biBmcmVlX3BhZ2VfbGlzdCkuCj4gCj4gU28gaW5zdGVhZCBvZiBvbmx5IHJldmVydGluZywgSSB0
aGluayB3ZSBzaG91bGQgc3BsaXQgaXQgdXAgYW5kIGFsd2F5cwo+IHJlZ2lzdGVyIHRoZSBzaHJp
bmtlciBmb3IgVklSVElPX0JBTExPT05fRl9GUkVFX1BBR0VfSElOVCBhbmQgdGhlIE9PTQo+IG5v
dGlmaWVyIChhcyBiZWZvcmUpIGZvciBWSVJUSU9fQkFMTE9PTl9GX01VU1RfVEVMTF9IT1NULgoK
T0sgLi4uIEkgZ3Vlc3MgdGhhdCBtZWFucyB3ZSBuZWVkIHRvIGZpeCBzaHJpbmtlciB0byB0YWtl
ClZJUlRJT19CQUxMT09OX0ZfTVVTVF9URUxMX0hPU1QgaW50byBhY2NvdW50IGNvcnJlY3RseS4K
SG9zdHMgaWdub3JlIGl0IGF0IHRoZSBtb21lbnQgYnV0IGl0J3MgYSBmcmFnaWxlIHRoaW5nCnRv
IGRvIHdoYXQgaXQgZG9lcyBhbmQgaWdub3JlIHVzZWQgYnVmZmVycy4KCj4gKE9mIGNvdXJzZSwg
YWRhcHRpbmcgd2hhdCBpcyBiZWluZyBkb25lIGluIHRoZSBzaHJpbmtlciBhbmQgaW4gdGhlIE9P
TQo+IG5vdGlmaWVyKQo+IAo+IC0tIAo+IFRoYW5rcywKPiAKPiBEYXZpZCAvIGRoaWxkZW5iCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
