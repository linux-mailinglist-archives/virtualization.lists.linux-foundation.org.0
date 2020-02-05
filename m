Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A822E15291C
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 11:27:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1F01485C05;
	Wed,  5 Feb 2020 10:27:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4PIe0t1wa8IT; Wed,  5 Feb 2020 10:27:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 64F0784A6C;
	Wed,  5 Feb 2020 10:27:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F1DAC0174;
	Wed,  5 Feb 2020 10:27:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FFFEC0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 10:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 08E0C2047C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 10:27:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZdZibXGwRh4u
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 10:27:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 9E328203D0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 10:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580898472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cW1b82F1PITWykLK+hGaf47Vke07eMy3FQk2TjUggGs=;
 b=b/H+tQP3xVubBpj6WU8q1jIgjScgGFXPGemYpleTPbxyK7IfHvkXfB2cbhLbvpIsZ9zkxx
 gDLbosbLxIDOrN0yr5oSCIDMS0LpVg7OIh1TUUWpkhoEEIq5brnNLw9q+acXzxVlzWIHBa
 /niF4b9CrcQXwuDKi4RNSQVDCMmFuHw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-phajuSZfN5W54wbNWtJHtg-1; Wed, 05 Feb 2020 05:27:50 -0500
Received: by mail-qv1-f72.google.com with SMTP id e10so1162840qvq.18
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Feb 2020 02:27:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=cW1b82F1PITWykLK+hGaf47Vke07eMy3FQk2TjUggGs=;
 b=UgzExUSRzSRHfRQf/NulRM6yWsu6rOX+rAtbw/V/+0ZYRGUR2weaeTJ6uCCz4jZxFV
 0N3vImDMH5CaW0QHi4ofISOTyhDJwzl3vwzk5nVK+oHUnSEATFY4EgfYT3xUo0phi9W4
 wadu7buU/V66rgQecmBhnPtJ8ldOY3rvJI7EzIShT8WHR6dIW1yGSjT53LCw9Zy+LJr3
 OwcfQt/EtWTx9kFeV02keULwUIEivt7Y4gcIM1BrKJuNIIRmP5FHYzsT6ZCmoR6i9UJ2
 tWNU7894iWbKdjiSSiJUb2PVDMPvQG4bBW+Q0vbG050vloLhfRWnhBoFxx0C6KwfW0Hf
 vQMg==
X-Gm-Message-State: APjAAAWLomk2iJ7I2WjAy/hEBOfCKoONJl8wkYhLUcn+OUPTkiuDCxvn
 l+4ihRbfAQDc4RRcb5MkzLyjOAWrJiIcM+Hr1wKJX2YYuZPhRxP3t+cyMoRU/5j9l5w/U7jMDOS
 IDEWEwAOfIl7KBb2zfuyi7p8oI653zV1rBgEL7KLBRQ==
X-Received: by 2002:ac8:7b29:: with SMTP id l9mr31716915qtu.141.1580898469592; 
 Wed, 05 Feb 2020 02:27:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqyqWPcxZs+M6fAFj2LtT+PEHBGg6JTnya60dAPCPVdp/LYRW/TIc9Q3mttRYgjIOa+1coF9ow==
X-Received: by 2002:ac8:7b29:: with SMTP id l9mr31716892qtu.141.1580898469295; 
 Wed, 05 Feb 2020 02:27:49 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id y26sm12965707qtv.28.2020.02.05.02.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 02:27:48 -0800 (PST)
Date: Wed, 5 Feb 2020 05:27:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: Balloon pressuring page cache
Message-ID: <20200205052548-mutt-send-email-mst@kernel.org>
References: <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
 <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
 <286AC319A985734F985F78AFA26841F73E3F8A02@shsmsx102.ccr.corp.intel.com>
 <CAJuQAmqcayaNuG19fKCuux=YVO3+VcN-qrXvobgKMykogeMkzA@mail.gmail.com>
 <20200203080520-mutt-send-email-mst@kernel.org>
 <5ac131de8e3b7fc1fafd05a61feb5f6889aeb917.camel@linux.intel.com>
 <c836a8d1-c5cc-eb8b-84ed-027070b77bf8@redhat.com>
 <539B606A-A0CA-4AA4-B99A-759C874A1EF8@vmware.com>
 <08D323B9-0B4A-47B2-9955-511B8FBA056B@vmware.com>
 <dd5aa189-daed-7008-d02b-4e5bd61fe6e1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <dd5aa189-daed-7008-d02b-4e5bd61fe6e1@redhat.com>
X-MC-Unique: phajuSZfN5W54wbNWtJHtg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Tyler Sanderson <tysand@google.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Nadav Amit <namit@vmware.com>, David Rientjes <rientjes@google.com>,
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

T24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMDk6MTk6NThBTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gT24gMDUuMDIuMjAgMDg6MzUsIE5hZGF2IEFtaXQgd3JvdGU6Cj4gPj4gT24g
RmViIDMsIDIwMjAsIGF0IDI6NTAgUE0sIE5hZGF2IEFtaXQgPG5hbWl0QHZtd2FyZS5jb20+IHdy
b3RlOgo+ID4+Cj4gPj4+IE9uIEZlYiAzLCAyMDIwLCBhdCA4OjM0IEFNLCBEYXZpZCBIaWxkZW5i
cmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPj4+Cj4gPj4+IE9uIDAzLjAyLjIwIDE3
OjE4LCBBbGV4YW5kZXIgRHV5Y2sgd3JvdGU6Cj4gPj4+PiBPbiBNb24sIDIwMjAtMDItMDMgYXQg
MDg6MTEgLTA1MDAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiA+Pj4+PiBPbiBUaHUsIEph
biAzMCwgMjAyMCBhdCAxMTo1OTo0NkFNIC0wODAwLCBUeWxlciBTYW5kZXJzb24gd3JvdGU6Cj4g
Pj4+Pj4+IE9uIFRodSwgSmFuIDMwLCAyMDIwIGF0IDc6MzEgQU0gV2FuZywgV2VpIFcgPHdlaS53
LndhbmdAaW50ZWwuY29tPiB3cm90ZToKPiA+Pj4+Pj4KPiA+Pj4+Pj4gICBPbiBUaHVyc2RheSwg
SmFudWFyeSAzMCwgMjAyMCAxMTowMyBQTSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gPj4+
Pj4+PiBPbiAyOS4wMS4yMCAyMDoxMSwgVHlsZXIgU2FuZGVyc29uIHdyb3RlOgo+ID4+Pj4+Pj4+
IE9uIFdlZCwgSmFuIDI5LCAyMDIwIGF0IDI6MzEgQU0gRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlk
QHJlZGhhdC5jb20KPiA+Pj4+Pj4+PiA8bWFpbHRvOmRhdmlkQHJlZGhhdC5jb20+PiB3cm90ZToK
PiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+ICAgT24gMjkuMDEuMjAgMDE6MjIsIFR5bGVyIFNhbmRlcnNv
biB2aWEgVmlydHVhbGl6YXRpb24gd3JvdGU6Cj4gPj4+Pj4+Pj4+IEEgcHJpbWFyeSBhZHZhbnRh
Z2Ugb2YgdmlydGlvIGJhbGxvb24gb3ZlciBvdGhlciBtZW1vcnkgcmVjbGFpbQo+ID4+Pj4+Pj4+
PiBtZWNoYW5pc21zIGlzIHRoYXQgaXQgY2FuIHByZXNzdXJlIHRoZSBndWVzdCdzIHBhZ2UgY2Fj
aGUgaW50bwo+ID4+Pj4+Pj4+ICAgc2hyaW5raW5nLgo+ID4+Pj4+Pj4+PiBIb3dldmVyLCBzaW5j
ZSB0aGUgYmFsbG9vbiBkcml2ZXIgY2hhbmdlZCB0byB1c2luZyB0aGUgc2hyaW5rZXIKPiA+Pj4+
Pj4gICBBUEkKPiA+Pj4+Pj4+IDxodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29t
bWl0LzcxOTk0NjIwYmIyNWE4YjEwOTM4OGZlZmE5Cj4gPj4+Pj4+PiBlOTlhMjhlMzU1MjU1YSNk
aWZmLWZkMjAyYWNmNjk0ZDllYmExOWM4YzY0ZGEzZTQ4MGM5PiB0aGlzCj4gPj4+Pj4+Pj4+IHVz
ZSBjYXNlIGhhcyBiZWNvbWUgYSBiaXQgbW9yZSB0cmlja3kuIEknbSB3b25kZXJpbmcgd2hhdCB0
aGUKPiA+Pj4+Pj4+IGludGVuZGVkCj4gPj4+Pj4+Pj4+IGRldmljZSBpbXBsZW1lbnRhdGlvbiBp
cy4KPiA+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4gV2hlbiBpbmZsYXRpbmcgdGhlIGJhbGxvb24gYWdh
aW5zdCBwYWdlIGNhY2hlIChpLmUuIG5vIGZyZWUKPiA+Pj4+Pj4gICBtZW1vcnkKPiA+Pj4+Pj4+
Pj4gcmVtYWlucykgdm1zY2FuLmMgd2lsbCBib3RoIHNocmluayBwYWdlIGNhY2hlLCBidXQgYWxz
byBpbnZva2UKPiA+Pj4+Pj4gICB0aGUKPiA+Pj4+Pj4+Pj4gc2hyaW5rZXJzIC0tIGluY2x1ZGlu
ZyB0aGUgYmFsbG9vbidzIHNocmlua2VyLiBTbyB0aGUgYmFsbG9vbgo+ID4+Pj4+PiAgIGRyaXZl
cgo+ID4+Pj4+Pj4+PiBhbGxvY2F0ZXMgbWVtb3J5IHdoaWNoIHJlcXVpcmVzIHJlY2xhaW0sIHZt
c2NhbiBnZXRzIHRoaXMgbWVtb3J5Cj4gPj4+Pj4+PiBieQo+ID4+Pj4+Pj4+PiBzaHJpbmtpbmcg
dGhlIGJhbGxvb24sIGFuZCB0aGVuIHRoZSBkcml2ZXIgYWRkcyB0aGUgbWVtb3J5IGJhY2sKPiA+
Pj4+Pj4gICB0bwo+ID4+Pj4+Pj4gdGhlCj4gPj4+Pj4+Pj4+IGJhbGxvb24uIEJhc2ljYWxseSBh
IGJ1c3kgbm8tb3AuCj4gPj4+Pj4+Cj4gPj4+Pj4+ICAgUGVyIG15IHVuZGVyc3RhbmRpbmcsIHRo
ZSBiYWxsb29uIGFsbG9jYXRpb24gd29u4oCZdCBpbnZva2Ugc2hyaW5rZXIgYXMKPiA+Pj4+Pj4g
ICBfX0dGUF9ESVJFQ1RfUkVDTEFJTSBpc24ndCBzZXQsIG5vPwo+ID4+Pj4+Pgo+ID4+Pj4+PiBJ
IGNvdWxkIGJlIHdyb25nIGFib3V0IHRoZSBtZWNoYW5pc20sIGJ1dCB0aGUgZGV2aWNlIHNlZXMg
bG90cyBvZiBhY3Rpdml0eSBvbgo+ID4+Pj4+PiB0aGUgZGVmbGF0ZSBxdWV1ZS4gVGhlIGJhbGxv
b24gaXMgYmVpbmcgc2hydW5rLiBBbmQgdGhpcyBvbmx5IHN0YXJ0cyBvbmNlIGFsbAo+ID4+Pj4+
PiBmcmVlIG1lbW9yeSBpcyBkZXBsZXRlZCBhbmQgd2UncmUgaW5mbGF0aW5nIGludG8gcGFnZSBj
YWNoZS4KPiA+Pj4+Pgo+ID4+Pj4+IFNvIGdpdmVuIHRoaXMgbG9va3MgbGlrZSBhIHJlZ3Jlc3Np
b24sIG1heWJlIHdlIHNob3VsZCByZXZlcnQgdGhlCj4gPj4+Pj4gcGF0Y2ggaW4gcXVlc3Rpb24g
NzE5OTQ2MjBiYjI1ICgidmlydGlvX2JhbGxvb246IHJlcGxhY2Ugb29tIG5vdGlmaWVyIHdpdGgg
c2hyaW5rZXIiKQo+ID4+Pj4+IEJlc2lkZXMsIHdpdGggVklSVElPX0JBTExPT05fRl9GUkVFX1BB
R0VfSElOVAo+ID4+Pj4+IHNocmlua2VyIGFsc28gaWdub3JlcyBWSVJUSU9fQkFMTE9PTl9GX01V
U1RfVEVMTF9IT1NUIHdoaWNoIGlzbid0IG5pY2UKPiA+Pj4+PiBhdCBhbGwuCj4gPj4+Pj4KPiA+
Pj4+PiBTbyBpdCBsb29rcyBsaWtlIGFsbCB0aGlzIHJld29yayBpbnRyb2R1Y2VkIG1vcmUgaXNz
dWVzIHRoYW4gaXQKPiA+Pj4+PiBhZGRyZXNzZWQgLi4uCj4gPj4+Pj4KPiA+Pj4+PiBJIGFsc28g
Q0MgQWxleCBEdXljayBmb3IgYW4gb3BpbmlvbiBvbiB0aGlzLgo+ID4+Pj4+IEFsZXgsIHdoYXQg
ZG8geW91IHVzZSB0byBwdXQgcHJlc3N1cmUgb24gcGFnZSBjYWNoZT8KPiA+Pj4+Cj4gPj4+PiBJ
IHdvdWxkIHNheSByZXZlcnRpbmcgcHJvYmFibHkgbWFrZXMgc2Vuc2UuIEknbSBub3Qgc3VyZSB0
aGVyZSBpcyBtdWNoCj4gPj4+PiB2YWx1ZSB0byBoYXZpbmcgYSBzaHJpbmtlciBydW5uaW5nIGRl
ZmxhdGlvbiB3aGVuIHlvdSBhcmUgYWN0aXZlbHkgdHJ5aW5nCj4gPj4+PiB0byBpbmNyZWFzZSB0
aGUgYmFsbG9vbi4gSXQgd291bGQgbWFrZSBtb3JlIHNlbnNlIHRvIHdhaXQgdW50aWwgeW91IGFy
ZQo+ID4+Pj4gYWN0dWFsbHkgYWJvdXQgdG8gc3RhcnQgaGl0dGluZyBvb20uCj4gPj4+Cj4gPj4+
IEkgdGhpbmsgdGhlIHNocmlua2VyIG1ha2VzIHNlbnNlIGZvciBmcmVlIHBhZ2UgaGludGluZyBm
ZWF0dXJlCj4gPj4+IChldmVyeXRoaW5nIG9uIGZyZWVfcGFnZV9saXN0KS4KPiA+Pj4KPiA+Pj4g
U28gaW5zdGVhZCBvZiBvbmx5IHJldmVydGluZywgSSB0aGluayB3ZSBzaG91bGQgc3BsaXQgaXQg
dXAgYW5kIGFsd2F5cwo+ID4+PiByZWdpc3RlciB0aGUgc2hyaW5rZXIgZm9yIFZJUlRJT19CQUxM
T09OX0ZfRlJFRV9QQUdFX0hJTlQgYW5kIHRoZSBPT00KPiA+Pj4gbm90aWZpZXIgKGFzIGJlZm9y
ZSkgZm9yIFZJUlRJT19CQUxMT09OX0ZfTVVTVF9URUxMX0hPU1QuCj4gPj4+Cj4gPj4+IChPZiBj
b3Vyc2UsIGFkYXB0aW5nIHdoYXQgaXMgYmVpbmcgZG9uZSBpbiB0aGUgc2hyaW5rZXIgYW5kIGlu
IHRoZSBPT00KPiA+Pj4gbm90aWZpZXIpCj4gPj4KPiA+PiBEYXZpZCwKPiA+Pgo+ID4+IFBsZWFz
ZSBrZWVwIG1lIHBvc3RlZC4gSSBkZWNpZGVkIHRvIGFkYXB0IHRoZSBzYW1lIHNvbHV0aW9uIGFz
IHRoZSB2aXJ0aW8KPiA+PiBiYWxsb29uIGZvciB0aGUgVk13YXJlIGJhbGxvb24uIElmIHRoZSB2
ZXJkaWN0IGlzIHRoYXQgdGhpcyBpcyBkYW1hZ2luZyBhbmQKPiA+PiB0aGUgT09NIG5vdGlmaWVy
IHNob3VsZCBiZSB1c2VkIGluc3RlYWQsIEkgd2lsbCBzdWJtaXQgcGF0Y2hlcyB0byBtb3ZlIHRv
Cj4gPj4gT09NIG5vdGlmaWVyIGFzIHdlbGwuCj4gPiAKPiA+IEFkZGluZyBzb21lIGluZm9ybWF0
aW9uIGZvciB0aGUgcmVjb3JkIChpZiBzb21lb25lIGdvb2dsZXMgdGhpcyB0aHJlYWQpOgo+ID4g
Cj4gPiBJbiB0aGUgVk13YXJlIGJhbGxvb24gZHJpdmVyLCB0aGUgc2hyaW5rZXIgaXMgZGlzYWJs
ZWQgYnkgZGVmYXVsdCBzaW5jZSB3ZQo+ID4gZW5jb3VudGVyZWQgYSBwZXJmb3JtYW5jZSBkZWdy
YWRhdGlvbiBpbiB0ZXN0aW5nLiBJIHRyaWVkIHRvIGF2b2lkIHJhcGlkCj4gPiBpbmZsYXRpb24v
c2hyaW5rZXItZGVmbGF0aW9uIGN5Y2xlcyBieSBhZGRpbmcgYSB0aW1lb3V0LCBidXQgYXBwYXJl
bnRseSBpdAo+ID4gZGlkIG5vdCBoZWxwIGluIGF2b2lkaW5nIHRoZSBwZXJmb3JtYW5jZSByZWdy
ZXNzaW9uLgo+IAo+IFRoYW5rcyBmb3IgdGhhdCBpbmZvLiBUbyBtZSB0aGF0IHNvdW5kcyBsaWtl
IHRoZSBzaHJpbmtlciBpcyB0aGUgd3JvbmcKPiBhcHByb2FjaCB0byAiYXV0by1kZWZsYXRpb24i
LiBJdCdzIG5vdCBqdXN0ICJzb21lIHNsYWIgY2FjaGUiLgoKU28gYXMgeW91IHBvaW50ZWQgb3V0
IHlvdXJzZWxmIGRlZmxhdGUgb24gb29tIGlzIHJlYWxseSB1bmRlci1zcGVjaWZpZWQuCgpJIHdv
dWxkIGJlIHZlcnkgaGFwcHkgaWYgeW91IGNvdWxkIHRha2UgYSBzdHViIGF0IGRvY3VtZW50aW5n
IHdoYXQncwpleHBlY3RlZCBmcm9tIGd1ZXN0IGFuZCBob3cgaXQgY291bGQgYmUgdXNlZC4KUGxl
YXNlIGNvcHkgdGhlIHZpcnRpbyBUQyB3aGVuIHlvdSBkbyB0aGlzIGFzIHRoaXMgaXMgc3BlYyBz
dHVmZi4KCgo+IAo+IC0tIAo+IFRoYW5rcywKPiAKPiBEYXZpZCAvIGRoaWxkZW5iCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
