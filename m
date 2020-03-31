Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 397EC19979F
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 15:37:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E27ED87AC8;
	Tue, 31 Mar 2020 13:37:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P+DDzDDO-vHB; Tue, 31 Mar 2020 13:37:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 28EE887A79;
	Tue, 31 Mar 2020 13:37:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13457C1D8A;
	Tue, 31 Mar 2020 13:37:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03791C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 13:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E684586C26
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 13:37:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1_N4rBYYtR4v
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 13:37:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DA58886C19
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 13:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585661845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14WjY7npFb95dfs4u91xTUnm/drEuiMIwCcYb9+aV0E=;
 b=R3S7DA5kvMu/+ssV72RMKZgz/uHJ/MRyOBJ4gFxubl4248DQhxwPIfHIGxM3NxivsJcB4a
 P9tX5pj9KL0HhCF1i6TSimzdrbn0MynNk9RPcDVUQgNrKwgwAKBDWEuZCuXZ9uHiUtRv3d
 nyHM/WoHeFSldFfd6AWJ4IIBRhPzUto=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-X3AlArSoMUqIZCOI2Dzy4Q-1; Tue, 31 Mar 2020 09:37:24 -0400
X-MC-Unique: X3AlArSoMUqIZCOI2Dzy4Q-1
Received: by mail-wm1-f72.google.com with SMTP id p18so1062982wmk.9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 06:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=14WjY7npFb95dfs4u91xTUnm/drEuiMIwCcYb9+aV0E=;
 b=MAwq6i7kwQ+zptadLpQFTvfcmB0h5UV/daYk8AEd2mERU0Q4EiTDcOU0F38M+A3phC
 xboz55j/NTARqZyHjHO36biMv7oze0nK6V7Cy0HnnpfVcoxMIExLanEGt81wzZHn17ur
 iCp6r8jlLTBrtQAovjL4DoL+4ynyrWN4W2jRpwGweAdH0Gr/REw6fomP8YatmP7lgByg
 B6WA8/Z3r4YDShTTYtlk4XXOZGDF0kfGcB9kEWeZ2yX8+t9jRzErzLW3OUjmUHUn92sm
 ct4vvStYU3zu3TnwX4tujWmbO9axdV3NmzqOQBHN/QRlE7HcKgrWWkPmQvw+MRlSjCwk
 sTwg==
X-Gm-Message-State: AGi0PuZEn2m6gwVLeGVtLll3EvZ1y0Btje1mub4n46rQFa/+nDJeEmZu
 jdzgzDElKfeXbRhb1J7+AVkrYn2fjMstKedfVXRZ5YWd+/DnNVzNHdmbuTnzCzAwLNkH0PWFZaO
 CQtuOFg3IvgqZPiuXyfA/3eSVff3f5bWO83AgVpkVgQ==
X-Received: by 2002:a05:600c:294d:: with SMTP id
 n13mr338172wmd.155.1585661843028; 
 Tue, 31 Mar 2020 06:37:23 -0700 (PDT)
X-Google-Smtp-Source: APiQypLHOVQZvcKj5qnhJ3T+XcRb/jgIhPeq4jvZUSNB0Q2o5aF7+L0uVNJTtAjoRsYEjD9/meV5Hg==
X-Received: by 2002:a05:600c:294d:: with SMTP id
 n13mr338144wmd.155.1585661842712; 
 Tue, 31 Mar 2020 06:37:22 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id n2sm28124947wro.25.2020.03.31.06.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 06:37:22 -0700 (PDT)
Date: Tue, 31 Mar 2020 09:37:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC for Linux] virtio_balloon: Add VIRTIO_BALLOON_F_THP_ORDER
 to handle THP spilt issue
Message-ID: <20200331093300-mutt-send-email-mst@kernel.org>
References: <20200326031817-mutt-send-email-mst@kernel.org>
 <C4C6BAF7-C040-403D-997C-48C7AB5A7D6B@redhat.com>
 <20200326054554-mutt-send-email-mst@kernel.org>
 <f26dc94a-7296-90c9-56cd-4586b78bc03d@redhat.com>
 <20200331091718-mutt-send-email-mst@kernel.org>
 <02a393ce-c4b4-ede9-7671-76fa4c19097a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <02a393ce-c4b4-ede9-7671-76fa4c19097a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: pagupta@redhat.com, Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 qemu-devel@nongnu.org, mojha@codeaurora.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, namit@vmware.com,
 Hui Zhu <teawaterz@linux.alibaba.com>, akpm@linux-foundation.org,
 Hui Zhu <teawater@gmail.com>
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

T24gVHVlLCBNYXIgMzEsIDIwMjAgYXQgMDM6MzI6MDVQTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gT24gMzEuMDMuMjAgMTU6MjQsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToK
PiA+IE9uIFR1ZSwgTWFyIDMxLCAyMDIwIGF0IDEyOjM1OjI0UE0gKzAyMDAsIERhdmlkIEhpbGRl
bmJyYW5kIHdyb3RlOgo+ID4+IE9uIDI2LjAzLjIwIDEwOjQ5LCBNaWNoYWVsIFMuIFRzaXJraW4g
d3JvdGU6Cj4gPj4+IE9uIFRodSwgTWFyIDI2LCAyMDIwIGF0IDA4OjU0OjA0QU0gKzAxMDAsIERh
dmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+ID4+Pj4KPiA+Pj4+Cj4gPj4+Pj4gQW0gMjYuMDMuMjAy
MCB1bSAwODoyMSBzY2hyaWViIE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Ogo+
ID4+Pj4+Cj4gPj4+Pj4g77u/T24gVGh1LCBNYXIgMTIsIDIwMjAgYXQgMDk6NTE6MjVBTSArMDEw
MCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gPj4+Pj4+PiBPbiAxMi4wMy4yMCAwOTo0Nywg
TWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+ID4+Pj4+Pj4gT24gVGh1LCBNYXIgMTIsIDIwMjAg
YXQgMDk6Mzc6MzJBTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gPj4+Pj4+Pj4g
Mi4gWW91IGFyZSBlc3NlbnRpYWxseSBzdGVhbGluZyBUSFBzIGluIHRoZSBndWVzdC4gU28gdGhl
IGZhc3Rlc3QKPiA+Pj4+Pj4+PiBtYXBwaW5nIChUSFAgaW4gZ3Vlc3QgYW5kIGhvc3QpIGlzIGdv
bmUuIFRoZSBndWVzdCB3b24ndCBiZSBhYmxlIHRvIG1ha2UKPiA+Pj4+Pj4+PiB1c2Ugb2YgVEhQ
IHdoZXJlIGl0IHByZXZpb3VzbHkgd2FzIGFibGUgdG8uIEkgY2FuIGltYWdpbmUgdGhpcyBpbXBs
aWVzIGEKPiA+Pj4+Pj4+PiBwZXJmb3JtYW5jZSBkZWdyYWRhdGlvbiBmb3Igc29tZSB3b3JrbG9h
ZHMuIFRoaXMgbmVlZHMgYSBwcm9wZXIKPiA+Pj4+Pj4+PiBwZXJmb3JtYW5jZSBldmFsdWF0aW9u
Lgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IEkgdGhpbmsgdGhlIHByb2JsZW0gaXMgbW9yZSB3aXRoIHRo
ZSBhbGxvY19wYWdlcyBBUEkuCj4gPj4+Pj4+PiBUaGF0IGdpdmVzIHlvdSBleGFjdGx5IHRoZSBn
aXZlbiBvcmRlciwgYW5kIGlmIHRoZXJlJ3MKPiA+Pj4+Pj4+IGEgbGFyZ2VyIGNodW5rIGF2YWls
YWJsZSwgaXQgd2lsbCBzcGxpdCBpdCB1cC4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBCdXQgZm9yIGJh
bGxvb24gLSBJIHN1c3BlY3QgbG90cyBvZiBvdGhlciB1c2VycywKPiA+Pj4+Pj4+IHdlIGRvIG5v
dCB3YW50IHRvIHN0cmVzcyB0aGUgc3lzdGVtIGJ1dCBpZiBhIGxhcmdlCj4gPj4+Pj4+PiBjaHVu
ayBpcyBhdmFpbGFibGUgYW55d2F5LCB0aGVuIHdlIGNvdWxkIGhhbmRsZQo+ID4+Pj4+Pj4gdGhh
dCBtb3JlIG9wdGltYWxseSBieSBnZXR0aW5nIGl0IGFsbCBpbiBvbmUgZ28uCj4gPj4+Pj4+Pgo+
ID4+Pj4+Pj4KPiA+Pj4+Pj4+IFNvIGlmIHdlIHdhbnQgdG8gYWRkcmVzcyB0aGlzLCBJTUhPIHRo
aXMgY2FsbHMgZm9yIGEgbmV3IEFQSS4KPiA+Pj4+Pj4+IEFsb25nIHRoZSBsaW5lcyBvZgo+ID4+
Pj4+Pj4KPiA+Pj4+Pj4+ICAgIHN0cnVjdCBwYWdlICphbGxvY19wYWdlX3JhbmdlKGdmcF90IGdm
cCwgdW5zaWduZWQgaW50IG1pbl9vcmRlciwKPiA+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBpbnQgbWF4X29yZGVyLCB1bnNpZ25lZCBpbnQgKm9yZGVyKQo+ID4+Pj4+Pj4KPiA+
Pj4+Pj4+IHRoZSBpZGVhIHdvdWxkIHRoZW4gYmUgdG8gcmV0dXJuIGF0IGEgbnVtYmVyIG9mIHBh
Z2VzIGluIHRoZSBnaXZlbgo+ID4+Pj4+Pj4gcmFuZ2UuCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gV2hh
dCBkbyB5b3UgdGhpbms/IFdhbnQgdG8gdHJ5IGltcGxlbWVudGluZyB0aGF0Pwo+ID4+Pj4+Pgo+
ID4+Pj4+PiBZb3UgY2FuIGp1c3Qgc3RhcnQgd2l0aCB0aGUgaGlnaGVzdCBvcmRlciBhbmQgZGVj
cmVtZW50IHRoZSBvcmRlciB1bnRpbAo+ID4+Pj4+PiB5b3VyIGFsbG9jYXRpb24gc3VjY2VlZHMg
dXNpbmcgYWxsb2NfcGFnZXMoKSwgd2hpY2ggd291bGQgYmUgZW5vdWdoIGZvcgo+ID4+Pj4+PiBh
IGZpcnN0IHZlcnNpb24uIEF0IGxlYXN0IEkgZG9uJ3Qgc2VlIHRoZSBpbW1lZGlhdGUgbmVlZCBm
b3IgYSBuZXcKPiA+Pj4+Pj4ga2VybmVsIEFQSS4KPiA+Pj4+Pgo+ID4+Pj4+IE9LIEkgcmVtZW1i
ZXIgbm93LiAgVGhlIHByb2JsZW0gaXMgd2l0aCByZWNsYWltLiBVbmxlc3MgcmVjbGFpbSBpcwo+
ID4+Pj4+IGNvbXBsZXRlbHkgZGlzYWJsZWQsIGFueSBvZiB0aGVzZSBjYWxscyBjYW4gc2xlZXAu
IEFmdGVyIGl0IHdha2VzIHVwLAo+ID4+Pj4+IHdlIHdvdWxkIGxpa2UgdG8gZ2V0IHRoZSBsYXJn
ZXIgb3JkZXIgdGhhdCBoYXMgYmVjb21lIGF2YWlsYWJsZQo+ID4+Pj4+IG1lYW53aGlsZS4KPiA+
Pj4+Pgo+ID4+Pj4KPiA+Pj4+IFllcywgYnV0IHRoYXTigJhzIGEgcHVyZSBvcHRpbWl6YXRpb24g
SU1ITy4KPiA+Pj4+IFNvIEkgdGhpbmsgd2Ugc2hvdWxkIGRvIGEgdHJpdmlhbCBpbXBsZW1lbnRh
dGlvbiBmaXJzdCBhbmQgdGhlbiBzZWUgd2hhdCB3ZSBnYWluIGZyb20gYSBuZXcgYWxsb2NhdG9y
IEFQSS4gVGhlbiB3ZSBtaWdodCBhbHNvIGJlIGFibGUgdG8ganVzdGlmeSBpdCB1c2luZyByZWFs
IG51bWJlcnMuCj4gPj4+Pgo+ID4+Pgo+ID4+PiBXZWxsIGhvdyBkbyB5b3UgcHJvcG9zZSBpbXBs
ZW1lbnQgdGhlIG5lY2Vzc2FyeSBzZW1hbnRpY3M/Cj4gPj4+IEkgdGhpbmsgd2UgYXJlIGJvdGgg
YWdyZWVkIHRoYXQgYWxsb2NfcGFnZV9yYW5nZSBpcyBtb3JlIG9yCj4gPj4+IGxlc3Mgd2hhdCdz
IG5lY2Vzc2FyeSBhbnl3YXkgLSBzbyBob3cgd291bGQgeW91IGFwcHJveGltYXRlIGl0Cj4gPj4+
IG9uIHRvcCBvZiBleGlzdGluZyBBUElzPwo+ID4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L2JhbGxvb25fY29tcGFjdGlvbi5oIGIvaW5jbHVkZS9saW51eC9iYWxsb29uX2NvbXBhY3Rpb24u
aAoKLi4uLi4KCgo+ID4+IGRpZmYgLS1naXQgYS9tbS9iYWxsb29uX2NvbXBhY3Rpb24uYyBiL21t
L2JhbGxvb25fY29tcGFjdGlvbi5jCj4gPj4gaW5kZXggMjZkZTAyMGFhZTdiLi4wNjc4MTBiMzI4
MTMgMTAwNjQ0Cj4gPj4gLS0tIGEvbW0vYmFsbG9vbl9jb21wYWN0aW9uLmMKPiA+PiArKysgYi9t
bS9iYWxsb29uX2NvbXBhY3Rpb24uYwo+ID4+IEBAIC0xMTIsMjMgKzExMiwzNSBAQCBzaXplX3Qg
YmFsbG9vbl9wYWdlX2xpc3RfZGVxdWV1ZShzdHJ1Y3QgYmFsbG9vbl9kZXZfaW5mbyAqYl9kZXZf
aW5mbywKPiA+PiAgRVhQT1JUX1NZTUJPTF9HUEwoYmFsbG9vbl9wYWdlX2xpc3RfZGVxdWV1ZSk7
Cj4gPj4gIAo+ID4+ICAvKgo+ID4+IC0gKiBiYWxsb29uX3BhZ2VfYWxsb2MgLSBhbGxvY2F0ZXMg
YSBuZXcgcGFnZSBmb3IgaW5zZXJ0aW9uIGludG8gdGhlIGJhbGxvb24KPiA+PiAtICoJCQlwYWdl
IGxpc3QuCj4gPj4gKyAqIGJhbGxvb25fcGFnZXNfYWxsb2MgLSBhbGxvY2F0ZXMgYSBuZXcgcGFn
ZSAob2YgYXQgbW9zdCB0aGUgZ2l2ZW4gb3JkZXIpCj4gPj4gKyAqIAkJCSBmb3IgaW5zZXJ0aW9u
IGludG8gdGhlIGJhbGxvb24gcGFnZSBsaXN0Lgo+ID4+ICAgKgo+ID4+ICAgKiBEcml2ZXIgbXVz
dCBjYWxsIHRoaXMgZnVuY3Rpb24gdG8gcHJvcGVybHkgYWxsb2NhdGUgYSBuZXcgYmFsbG9vbiBw
YWdlLgo+ID4+ICAgKiBEcml2ZXIgbXVzdCBjYWxsIGJhbGxvb25fcGFnZV9lbnF1ZXVlIGJlZm9y
ZSBkZWZpbml0aXZlbHkgcmVtb3ZpbmcgdGhlIHBhZ2UKPiA+PiAgICogZnJvbSB0aGUgZ3Vlc3Qg
c3lzdGVtLgo+ID4+ICAgKgo+ID4+ICsgKiBXaWxsIGZhbGwgYmFjayB0byBzbWFsbGVyIG9yZGVy
cyBpZiBhbGxvY2F0aW9uIGZhaWxzLiBUaGUgb3JkZXIgb2YgdGhlCj4gPj4gKyAqIGFsbG9jYXRl
ZCBwYWdlIGlzIHN0b3JlZCBpbiBwYWdlLT5wcml2YXRlLgo+ID4+ICsgKgo+ID4+ICAgKiBSZXR1
cm46IHN0cnVjdCBwYWdlIGZvciB0aGUgYWxsb2NhdGVkIHBhZ2Ugb3IgTlVMTCBvbiBhbGxvY2F0
aW9uIGZhaWx1cmUuCj4gPj4gICAqLwo+ID4+IC1zdHJ1Y3QgcGFnZSAqYmFsbG9vbl9wYWdlX2Fs
bG9jKHZvaWQpCj4gPj4gK3N0cnVjdCBwYWdlICpiYWxsb29uX3BhZ2VzX2FsbG9jKGludCBvcmRl
cikKPiA+PiAgewo+ID4+IC0Jc3RydWN0IHBhZ2UgKnBhZ2UgPSBhbGxvY19wYWdlKGJhbGxvb25f
bWFwcGluZ19nZnBfbWFzaygpIHwKPiA+PiAtCQkJCSAgICAgICBfX0dGUF9OT01FTUFMTE9DIHwg
X19HRlBfTk9SRVRSWSB8Cj4gPj4gLQkJCQkgICAgICAgX19HRlBfTk9XQVJOKTsKPiA+PiAtCXJl
dHVybiBwYWdlOwo+ID4+ICsJc3RydWN0IHBhZ2UgKnBhZ2U7Cj4gPj4gKwo+ID4+ICsJd2hpbGUg
KG9yZGVyID49IDApIHsKPiA+PiArCQlwYWdlID0gYWxsb2NfcGFnZXMoYmFsbG9vbl9tYXBwaW5n
X2dmcF9tYXNrKCkgfAo+ID4+ICsJCQkJICAgX19HRlBfTk9NRU1BTExPQyB8IF9fR0ZQX05PUkVU
UlkgfAo+ID4+ICsJCQkJICAgX19HRlBfTk9XQVJOLCBvcmRlcik7Cj4gPj4gKwkJaWYgKHBhZ2Up
IHsKPiA+PiArCQkJc2V0X3BhZ2VfcHJpdmF0ZShwYWdlLCBvcmRlcik7Cj4gPj4gKwkJCXJldHVy
biBwYWdlOwo+ID4+ICsJCX0KPiA+PiArCQlvcmRlci0tOwo+ID4+ICsJfQo+ID4+ICsJcmV0dXJu
IE5VTEw7Cj4gPj4gIH0KPiA+PiAtRVhQT1JUX1NZTUJPTF9HUEwoYmFsbG9vbl9wYWdlX2FsbG9j
KTsKPiA+PiArRVhQT1JUX1NZTUJPTF9HUEwoYmFsbG9vbl9wYWdlc19hbGxvYyk7Cj4gPj4gIAo+
ID4+ICAvKgo+ID4+ICAgKiBiYWxsb29uX3BhZ2VfZW5xdWV1ZSAtIGluc2VydHMgYSBuZXcgcGFn
ZSBpbnRvIHRoZSBiYWxsb29uIHBhZ2UgbGlzdC4KPiA+IAo+ID4gCj4gPiBJIHRoaW5rIHRoaXMg
d2lsbCB0cnkgdG8gaW52b2tlIGRpcmVjdCByZWNsYWltIGZyb20gdGhlIGZpcnN0IGl0ZXJhdGlv
bgo+ID4gdG8gZnJlZSB1cCB0aGUgbWF4IG9yZGVyLgo+IAo+ICVfX0dGUF9OT1JFVFJZOiBUaGUg
Vk0gaW1wbGVtZW50YXRpb24gd2lsbCB0cnkgb25seSB2ZXJ5IGxpZ2h0d2VpZ2h0Cj4gbWVtb3J5
IGRpcmVjdCByZWNsYWltIHRvIGdldCBzb21lIG1lbW9yeSB1bmRlciBtZW1vcnkgcHJlc3N1cmUg
KHRodXMgaXQKPiBjYW4gc2xlZXApLiBJdCB3aWxsIGF2b2lkIGRpc3J1cHRpdmUgYWN0aW9ucyBs
aWtlIE9PTSBraWxsZXIuCj4gCj4gQ2VydGFpbmx5IGdvb2QgZW5vdWdoIGZvciBhIGZpcnN0IHZl
cnNpb24gSSB3b3VsZCBzYXksIG5vPwoKRnJhbmtseSBob3cgd2VsbCB0aGF0IGJlaGF2ZXMgd291
bGQgZGVwZW5kIGEgbG90IG9uIHRoZSB3b3JrbG9hZC4KQ2FuIHJlZ3Jlc3MganVzdCBhcyB3ZWxs
LgoKRm9yIHRoZSAxc3QgdmVyc2lvbiBJJ2QgcHJlZmVyIHNvbWV0aGluZyB0aGF0IGlzIHRoZSBs
ZWFzdCBkaXNydXB0aXZlLAphbmQgdGhhdCBJTUhPIG1lYW5zIHdlIG9ubHkgdHJpZ2dlciByZWNs
YWltIGF0IGFsbCBpbiB0aGUgc2FtZSBjb25maWd1cmF0aW9uCmFzIG5vdyAtIHdoZW4gd2UgY2Fu
J3Qgc2F0aXNmeSB0aGUgbG93ZXN0IG9yZGVyIGFsbG9jYXRpb24uCgpBbnl0aGluZyBlbHNlIHdv
dWxkIGJlIGEgaHVnZSBhbW91bnQgb2YgdGVzdGluZyB3aXRoIGFsbCBraW5kIG9mCndvcmtsb2Fk
cy4KCi0tIApNU1QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
