Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0EE15295C
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 11:44:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7C6DF85C05;
	Wed,  5 Feb 2020 10:44:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3g1QEXvgaMLg; Wed,  5 Feb 2020 10:44:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BB61385B81;
	Wed,  5 Feb 2020 10:44:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9FB44C0174;
	Wed,  5 Feb 2020 10:44:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D34FAC0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 10:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C1F3985B73
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 10:44:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6eDXkW5DOlbS
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 10:44:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0033385B3B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 10:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580899439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rX8mnmQQnJ+iwegPjh5bwAw0fYKr26DwCE5y9Z7CRNE=;
 b=P54dEwqHkdHWqmTAboC7zUOsF5TDFpWYOtQ0GsqckIuec54fojhJj++LtIX31QxsyWZQrx
 fZV7XfxOxzuhc++qDlUCsa0FuLzvOSGuPMbWBs6TjjrC7KDUUTMF/J8wohA6fgNvHt1iIG
 YS9hSewtD7NBRHc7WKblOzVtOUURgDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-DTQQek8TOJm5LGjUJBSIFA-1; Wed, 05 Feb 2020 05:43:56 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43EFC800D54;
 Wed,  5 Feb 2020 10:43:54 +0000 (UTC)
Received: from [10.36.116.217] (ovpn-116-217.ams2.redhat.com [10.36.116.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFC265DA7B;
 Wed,  5 Feb 2020 10:43:49 +0000 (UTC)
Subject: Re: Balloon pressuring page cache
To: "Michael S. Tsirkin" <mst@redhat.com>
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
 <20200205052548-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <c967349f-c422-1505-ee13-8b0746b593c3@redhat.com>
Date: Wed, 5 Feb 2020 11:43:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200205052548-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: DTQQek8TOJm5LGjUJBSIFA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

T24gMDUuMDIuMjAgMTE6MjcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBXZWQsIEZl
YiAwNSwgMjAyMCBhdCAwOToxOTo1OEFNICswMTAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToK
Pj4gT24gMDUuMDIuMjAgMDg6MzUsIE5hZGF2IEFtaXQgd3JvdGU6Cj4+Pj4gT24gRmViIDMsIDIw
MjAsIGF0IDI6NTAgUE0sIE5hZGF2IEFtaXQgPG5hbWl0QHZtd2FyZS5jb20+IHdyb3RlOgo+Pj4+
Cj4+Pj4+IE9uIEZlYiAzLCAyMDIwLCBhdCA4OjM0IEFNLCBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2
aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+Pj4+Cj4+Pj4+IE9uIDAzLjAyLjIwIDE3OjE4LCBBbGV4
YW5kZXIgRHV5Y2sgd3JvdGU6Cj4+Pj4+PiBPbiBNb24sIDIwMjAtMDItMDMgYXQgMDg6MTEgLTA1
MDAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+Pj4+PiBPbiBUaHUsIEphbiAzMCwgMjAy
MCBhdCAxMTo1OTo0NkFNIC0wODAwLCBUeWxlciBTYW5kZXJzb24gd3JvdGU6Cj4+Pj4+Pj4+IE9u
IFRodSwgSmFuIDMwLCAyMDIwIGF0IDc6MzEgQU0gV2FuZywgV2VpIFcgPHdlaS53LndhbmdAaW50
ZWwuY29tPiB3cm90ZToKPj4+Pj4+Pj4KPj4+Pj4+Pj4gICBPbiBUaHVyc2RheSwgSmFudWFyeSAz
MCwgMjAyMCAxMTowMyBQTSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+Pj4+Pj4+PiBPbiAy
OS4wMS4yMCAyMDoxMSwgVHlsZXIgU2FuZGVyc29uIHdyb3RlOgo+Pj4+Pj4+Pj4+IE9uIFdlZCwg
SmFuIDI5LCAyMDIwIGF0IDI6MzEgQU0gRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5j
b20KPj4+Pj4+Pj4+PiA8bWFpbHRvOmRhdmlkQHJlZGhhdC5jb20+PiB3cm90ZToKPj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4+ICAgT24gMjkuMDEuMjAgMDE6MjIsIFR5bGVyIFNhbmRlcnNvbiB2aWEgVmly
dHVhbGl6YXRpb24gd3JvdGU6Cj4+Pj4+Pj4+Pj4+IEEgcHJpbWFyeSBhZHZhbnRhZ2Ugb2Ygdmly
dGlvIGJhbGxvb24gb3ZlciBvdGhlciBtZW1vcnkgcmVjbGFpbQo+Pj4+Pj4+Pj4+PiBtZWNoYW5p
c21zIGlzIHRoYXQgaXQgY2FuIHByZXNzdXJlIHRoZSBndWVzdCdzIHBhZ2UgY2FjaGUgaW50bwo+
Pj4+Pj4+Pj4+ICAgc2hyaW5raW5nLgo+Pj4+Pj4+Pj4+PiBIb3dldmVyLCBzaW5jZSB0aGUgYmFs
bG9vbiBkcml2ZXIgY2hhbmdlZCB0byB1c2luZyB0aGUgc2hyaW5rZXIKPj4+Pj4+Pj4gICBBUEkK
Pj4+Pj4+Pj4+IDxodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0LzcxOTk0
NjIwYmIyNWE4YjEwOTM4OGZlZmE5Cj4+Pj4+Pj4+PiBlOTlhMjhlMzU1MjU1YSNkaWZmLWZkMjAy
YWNmNjk0ZDllYmExOWM4YzY0ZGEzZTQ4MGM5PiB0aGlzCj4+Pj4+Pj4+Pj4+IHVzZSBjYXNlIGhh
cyBiZWNvbWUgYSBiaXQgbW9yZSB0cmlja3kuIEknbSB3b25kZXJpbmcgd2hhdCB0aGUKPj4+Pj4+
Pj4+IGludGVuZGVkCj4+Pj4+Pj4+Pj4+IGRldmljZSBpbXBsZW1lbnRhdGlvbiBpcy4KPj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+Pj4gV2hlbiBpbmZsYXRpbmcgdGhlIGJhbGxvb24gYWdhaW5zdCBwYWdl
IGNhY2hlIChpLmUuIG5vIGZyZWUKPj4+Pj4+Pj4gICBtZW1vcnkKPj4+Pj4+Pj4+Pj4gcmVtYWlu
cykgdm1zY2FuLmMgd2lsbCBib3RoIHNocmluayBwYWdlIGNhY2hlLCBidXQgYWxzbyBpbnZva2UK
Pj4+Pj4+Pj4gICB0aGUKPj4+Pj4+Pj4+Pj4gc2hyaW5rZXJzIC0tIGluY2x1ZGluZyB0aGUgYmFs
bG9vbidzIHNocmlua2VyLiBTbyB0aGUgYmFsbG9vbgo+Pj4+Pj4+PiAgIGRyaXZlcgo+Pj4+Pj4+
Pj4+PiBhbGxvY2F0ZXMgbWVtb3J5IHdoaWNoIHJlcXVpcmVzIHJlY2xhaW0sIHZtc2NhbiBnZXRz
IHRoaXMgbWVtb3J5Cj4+Pj4+Pj4+PiBieQo+Pj4+Pj4+Pj4+PiBzaHJpbmtpbmcgdGhlIGJhbGxv
b24sIGFuZCB0aGVuIHRoZSBkcml2ZXIgYWRkcyB0aGUgbWVtb3J5IGJhY2sKPj4+Pj4+Pj4gICB0
bwo+Pj4+Pj4+Pj4gdGhlCj4+Pj4+Pj4+Pj4+IGJhbGxvb24uIEJhc2ljYWxseSBhIGJ1c3kgbm8t
b3AuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+ICAgUGVyIG15IHVuZGVyc3RhbmRpbmcsIHRoZSBiYWxsb29u
IGFsbG9jYXRpb24gd29u4oCZdCBpbnZva2Ugc2hyaW5rZXIgYXMKPj4+Pj4+Pj4gICBfX0dGUF9E
SVJFQ1RfUkVDTEFJTSBpc24ndCBzZXQsIG5vPwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJIGNvdWxkIGJl
IHdyb25nIGFib3V0IHRoZSBtZWNoYW5pc20sIGJ1dCB0aGUgZGV2aWNlIHNlZXMgbG90cyBvZiBh
Y3Rpdml0eSBvbgo+Pj4+Pj4+PiB0aGUgZGVmbGF0ZSBxdWV1ZS4gVGhlIGJhbGxvb24gaXMgYmVp
bmcgc2hydW5rLiBBbmQgdGhpcyBvbmx5IHN0YXJ0cyBvbmNlIGFsbAo+Pj4+Pj4+PiBmcmVlIG1l
bW9yeSBpcyBkZXBsZXRlZCBhbmQgd2UncmUgaW5mbGF0aW5nIGludG8gcGFnZSBjYWNoZS4KPj4+
Pj4+Pgo+Pj4+Pj4+IFNvIGdpdmVuIHRoaXMgbG9va3MgbGlrZSBhIHJlZ3Jlc3Npb24sIG1heWJl
IHdlIHNob3VsZCByZXZlcnQgdGhlCj4+Pj4+Pj4gcGF0Y2ggaW4gcXVlc3Rpb24gNzE5OTQ2MjBi
YjI1ICgidmlydGlvX2JhbGxvb246IHJlcGxhY2Ugb29tIG5vdGlmaWVyIHdpdGggc2hyaW5rZXIi
KQo+Pj4+Pj4+IEJlc2lkZXMsIHdpdGggVklSVElPX0JBTExPT05fRl9GUkVFX1BBR0VfSElOVAo+
Pj4+Pj4+IHNocmlua2VyIGFsc28gaWdub3JlcyBWSVJUSU9fQkFMTE9PTl9GX01VU1RfVEVMTF9I
T1NUIHdoaWNoIGlzbid0IG5pY2UKPj4+Pj4+PiBhdCBhbGwuCj4+Pj4+Pj4KPj4+Pj4+PiBTbyBp
dCBsb29rcyBsaWtlIGFsbCB0aGlzIHJld29yayBpbnRyb2R1Y2VkIG1vcmUgaXNzdWVzIHRoYW4g
aXQKPj4+Pj4+PiBhZGRyZXNzZWQgLi4uCj4+Pj4+Pj4KPj4+Pj4+PiBJIGFsc28gQ0MgQWxleCBE
dXljayBmb3IgYW4gb3BpbmlvbiBvbiB0aGlzLgo+Pj4+Pj4+IEFsZXgsIHdoYXQgZG8geW91IHVz
ZSB0byBwdXQgcHJlc3N1cmUgb24gcGFnZSBjYWNoZT8KPj4+Pj4+Cj4+Pj4+PiBJIHdvdWxkIHNh
eSByZXZlcnRpbmcgcHJvYmFibHkgbWFrZXMgc2Vuc2UuIEknbSBub3Qgc3VyZSB0aGVyZSBpcyBt
dWNoCj4+Pj4+PiB2YWx1ZSB0byBoYXZpbmcgYSBzaHJpbmtlciBydW5uaW5nIGRlZmxhdGlvbiB3
aGVuIHlvdSBhcmUgYWN0aXZlbHkgdHJ5aW5nCj4+Pj4+PiB0byBpbmNyZWFzZSB0aGUgYmFsbG9v
bi4gSXQgd291bGQgbWFrZSBtb3JlIHNlbnNlIHRvIHdhaXQgdW50aWwgeW91IGFyZQo+Pj4+Pj4g
YWN0dWFsbHkgYWJvdXQgdG8gc3RhcnQgaGl0dGluZyBvb20uCj4+Pj4+Cj4+Pj4+IEkgdGhpbmsg
dGhlIHNocmlua2VyIG1ha2VzIHNlbnNlIGZvciBmcmVlIHBhZ2UgaGludGluZyBmZWF0dXJlCj4+
Pj4+IChldmVyeXRoaW5nIG9uIGZyZWVfcGFnZV9saXN0KS4KPj4+Pj4KPj4+Pj4gU28gaW5zdGVh
ZCBvZiBvbmx5IHJldmVydGluZywgSSB0aGluayB3ZSBzaG91bGQgc3BsaXQgaXQgdXAgYW5kIGFs
d2F5cwo+Pj4+PiByZWdpc3RlciB0aGUgc2hyaW5rZXIgZm9yIFZJUlRJT19CQUxMT09OX0ZfRlJF
RV9QQUdFX0hJTlQgYW5kIHRoZSBPT00KPj4+Pj4gbm90aWZpZXIgKGFzIGJlZm9yZSkgZm9yIFZJ
UlRJT19CQUxMT09OX0ZfTVVTVF9URUxMX0hPU1QuCj4+Pj4+Cj4+Pj4+IChPZiBjb3Vyc2UsIGFk
YXB0aW5nIHdoYXQgaXMgYmVpbmcgZG9uZSBpbiB0aGUgc2hyaW5rZXIgYW5kIGluIHRoZSBPT00K
Pj4+Pj4gbm90aWZpZXIpCj4+Pj4KPj4+PiBEYXZpZCwKPj4+Pgo+Pj4+IFBsZWFzZSBrZWVwIG1l
IHBvc3RlZC4gSSBkZWNpZGVkIHRvIGFkYXB0IHRoZSBzYW1lIHNvbHV0aW9uIGFzIHRoZSB2aXJ0
aW8KPj4+PiBiYWxsb29uIGZvciB0aGUgVk13YXJlIGJhbGxvb24uIElmIHRoZSB2ZXJkaWN0IGlz
IHRoYXQgdGhpcyBpcyBkYW1hZ2luZyBhbmQKPj4+PiB0aGUgT09NIG5vdGlmaWVyIHNob3VsZCBi
ZSB1c2VkIGluc3RlYWQsIEkgd2lsbCBzdWJtaXQgcGF0Y2hlcyB0byBtb3ZlIHRvCj4+Pj4gT09N
IG5vdGlmaWVyIGFzIHdlbGwuCj4+Pgo+Pj4gQWRkaW5nIHNvbWUgaW5mb3JtYXRpb24gZm9yIHRo
ZSByZWNvcmQgKGlmIHNvbWVvbmUgZ29vZ2xlcyB0aGlzIHRocmVhZCk6Cj4+Pgo+Pj4gSW4gdGhl
IFZNd2FyZSBiYWxsb29uIGRyaXZlciwgdGhlIHNocmlua2VyIGlzIGRpc2FibGVkIGJ5IGRlZmF1
bHQgc2luY2Ugd2UKPj4+IGVuY291bnRlcmVkIGEgcGVyZm9ybWFuY2UgZGVncmFkYXRpb24gaW4g
dGVzdGluZy4gSSB0cmllZCB0byBhdm9pZCByYXBpZAo+Pj4gaW5mbGF0aW9uL3Nocmlua2VyLWRl
ZmxhdGlvbiBjeWNsZXMgYnkgYWRkaW5nIGEgdGltZW91dCwgYnV0IGFwcGFyZW50bHkgaXQKPj4+
IGRpZCBub3QgaGVscCBpbiBhdm9pZGluZyB0aGUgcGVyZm9ybWFuY2UgcmVncmVzc2lvbi4KPj4K
Pj4gVGhhbmtzIGZvciB0aGF0IGluZm8uIFRvIG1lIHRoYXQgc291bmRzIGxpa2UgdGhlIHNocmlu
a2VyIGlzIHRoZSB3cm9uZwo+PiBhcHByb2FjaCB0byAiYXV0by1kZWZsYXRpb24iLiBJdCdzIG5v
dCBqdXN0ICJzb21lIHNsYWIgY2FjaGUiLgo+IAo+IFNvIGFzIHlvdSBwb2ludGVkIG91dCB5b3Vy
c2VsZiBkZWZsYXRlIG9uIG9vbSBpcyByZWFsbHkgdW5kZXItc3BlY2lmaWVkLgo+IAo+IEkgd291
bGQgYmUgdmVyeSBoYXBweSBpZiB5b3UgY291bGQgdGFrZSBhIHN0dWIgYXQgZG9jdW1lbnRpbmcg
d2hhdCdzCj4gZXhwZWN0ZWQgZnJvbSBndWVzdCBhbmQgaG93IGl0IGNvdWxkIGJlIHVzZWQuCj4g
UGxlYXNlIGNvcHkgdGhlIHZpcnRpbyBUQyB3aGVuIHlvdSBkbyB0aGlzIGFzIHRoaXMgaXMgc3Bl
YyBzdHVmZi4KClNvLCBJJ2xsIGZpcnN0IGdldCB0aGUgY29kZSBiYWNrIGludG8gdGhlIGRlc2ly
ZWQgc3RhdGUsIHNvIGF0IGxlYXN0IHdlCmhhdmUgYW4gYWdyZWVtZW50IG9mIGhvdyBpdCBzaG91
bGQgYmUsIGFuZCB0aGVuIGZvbGxvdyB1cCB3aXRoIGEgc3BlYwp1cGRhdGUuCgpNaWdodCB0YWtl
IHNvbWUgdGltZSwgdGhvdWdoIChwbGVudHkgb2Ygc3R1ZmYgdG8gZG8pLgoKLS0gClRoYW5rcywK
CkRhdmlkIC8gZGhpbGRlbmIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
