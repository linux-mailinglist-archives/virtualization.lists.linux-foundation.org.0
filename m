Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D9214DD7B
	for <lists.virtualization@lfdr.de>; Thu, 30 Jan 2020 16:03:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C05C987832;
	Thu, 30 Jan 2020 15:03:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BCm5gOsQ+CtX; Thu, 30 Jan 2020 15:03:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 13C0B876C7;
	Thu, 30 Jan 2020 15:03:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1329C1D84;
	Thu, 30 Jan 2020 15:03:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC566C0171
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jan 2020 15:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D455E876D5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jan 2020 15:03:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 67pSIAop1F-t
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jan 2020 15:03:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E2F4C876C7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jan 2020 15:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580396578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=C1mZ9Xz670CMTIXKhqdTtr9ZZI2UsuUvcQCGd8poxqc=;
 b=QB12nQwNV01H06oq7sXOdMMx2uvvJQw1HW496/TP1Ho799EEpprlLUQalRZ72FMcX2yKRC
 /7zmjilIPZBBFRztgnShMiq7WgB4PawOFOTvhO/TQDze2S96de5feC7P2OG282cJzIT47Z
 SakfS4UO0diJis8HMgKxzK8zpuHmPQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-2BRVJF31OJiY0FK7UNkcig-1; Thu, 30 Jan 2020 10:02:40 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE87F800E21;
 Thu, 30 Jan 2020 15:02:38 +0000 (UTC)
Received: from [10.36.117.231] (ovpn-117-231.ams2.redhat.com [10.36.117.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B38860BE0;
 Thu, 30 Jan 2020 15:02:34 +0000 (UTC)
Subject: Re: Balloon pressuring page cache
To: Tyler Sanderson <tysand@google.com>
References: <CAJuQAmpDUyve2S+oxp9tLUhuRcnddXnNztC5PmYOOCpY6c68xg@mail.gmail.com>
 <91270a68-ff48-88b0-219c-69801f0c252f@redhat.com>
 <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
Date: Thu, 30 Jan 2020 16:02:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 2BRVJF31OJiY0FK7UNkcig-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 David Rientjes <rientjes@google.com>,
 virtualization@lists.linux-foundation.org
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

T24gMjkuMDEuMjAgMjA6MTEsIFR5bGVyIFNhbmRlcnNvbiB3cm90ZToKPiAKPiAKPiBPbiBXZWQs
IEphbiAyOSwgMjAyMCBhdCAyOjMxIEFNIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQu
Y29tCj4gPG1haWx0bzpkYXZpZEByZWRoYXQuY29tPj4gd3JvdGU6Cj4gCj4gICAgIE9uIDI5LjAx
LjIwIDAxOjIyLCBUeWxlciBTYW5kZXJzb24gdmlhIFZpcnR1YWxpemF0aW9uIHdyb3RlOgo+ICAg
ICA+IEEgcHJpbWFyeSBhZHZhbnRhZ2Ugb2YgdmlydGlvIGJhbGxvb24gb3ZlciBvdGhlcsKgbWVt
b3J5IHJlY2xhaW0KPiAgICAgPiBtZWNoYW5pc21zIGlzIHRoYXQgaXQgY2FuwqBwcmVzc3VyZSB0
aGUgZ3Vlc3QncyBwYWdlIGNhY2hlIGludG8KPiAgICAgc2hyaW5raW5nLgo+ICAgICA+Cj4gICAg
ID4gSG93ZXZlciwgc2luY2UgdGhlIGJhbGxvb24gZHJpdmVyIGNoYW5nZWQgdG8gdXNpbmcgdGhl
IHNocmlua2VyIEFQSQo+ICAgICA+Cj4gICAgIDxodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMv
bGludXgvY29tbWl0LzcxOTk0NjIwYmIyNWE4YjEwOTM4OGZlZmE5ZTk5YTI4ZTM1NTI1NWEjZGlm
Zi1mZDIwMmFjZjY5NGQ5ZWJhMTljOGM2NGRhM2U0ODBjOT7CoHRoaXMKPiAgICAgPiB1c2UgY2Fz
ZSBoYXMgYmVjb21lIGEgYml0IG1vcmUgdHJpY2t5LiBJJ20gd29uZGVyaW5nIHdoYXQgdGhlIGlu
dGVuZGVkCj4gICAgID4gZGV2aWNlIGltcGxlbWVudGF0aW9uIGlzLgo+ICAgICA+Cj4gICAgID4g
V2hlbiBpbmZsYXRpbmcgdGhlIGJhbGxvb24gYWdhaW5zdCBwYWdlIGNhY2hlIChpLmUuIG5vIGZy
ZWUgbWVtb3J5Cj4gICAgID4gcmVtYWlucykgdm1zY2FuLmMgd2lsbCBib3RoIHNocmluayBwYWdl
IGNhY2hlLCBidXQgYWxzbyBpbnZva2UgdGhlCj4gICAgID4gc2hyaW5rZXJzIC0tIGluY2x1ZGlu
ZyB0aGUgYmFsbG9vbidzIHNocmlua2VyLiBTbyB0aGUgYmFsbG9vbiBkcml2ZXIKPiAgICAgPiBh
bGxvY2F0ZXMgbWVtb3J5IHdoaWNoIHJlcXVpcmVzIHJlY2xhaW0sIHZtc2NhbiBnZXRzIHRoaXMg
bWVtb3J5IGJ5Cj4gICAgID4gc2hyaW5raW5nIHRoZSBiYWxsb29uLCBhbmQgdGhlbiB0aGUgZHJp
dmVyIGFkZHMgdGhlIG1lbW9yeSBiYWNrIHRvIHRoZQo+ICAgICA+IGJhbGxvb24uIEJhc2ljYWxs
eSBhIGJ1c3kgbm8tb3AuCj4gICAgID4KPiAgICAgPiBJZiBmaWxlIElPIGlzIG9uZ29pbmcgZHVy
aW5nIHRoaXMgYmFsbG9vbiBpbmZsYXRpb24gdGhlbiB0aGUgcGFnZQo+ICAgICBjYWNoZQo+ICAg
ICA+IGNvdWxkIGJlIGdyb3dpbmcgd2hpY2ggZnVydGhlciBwdXRzICJiYWNrIHByZXNzdXJlIiBv
biB0aGUgYmFsbG9vbgo+ICAgICA+IHRyeWluZyB0byBpbmZsYXRlLiBJbiB0ZXN0aW5nIEkndmUg
c2VlbiBwZXJpb2RzIG9mID4gNDUgc2Vjb25kcyB3aGVyZQo+ICAgICA+IGJhbGxvb24gaW5mbGF0
aW9uIG1ha2VzIG5vIG5ldCBmb3J3YXJkIHByb2dyZXNzLgo+ICAgICA+Cj4gICAgID4gVGhpcyB3
YXNuJ3QgYSBwcm9ibGVtIGJlZm9yZSB0aGUgY2hhbmdlIHRvIHRoZSBzaHJpbmtlciBBUEkgc2lu
Y2UKPiAgICAgZm9yY2VkCj4gICAgID4gYmFsbG9vbiBkZWZsYXRpb24gb25seSBvY2N1cnJlZCB2
aWEgdGhlIE9PTSBub3RpZmllciBjYWxsYmFjawo+ICAgICB3aGljaCB3YXMKPiAgICAgPiBpbnZv
a2VkIG9ubHkgYWZ0ZXIgdGhlIHBhZ2UgY2FjaGUgaGFkIGRlcGxldGVkLgo+ICAgICA+Cj4gICAg
ID4gSXMgdGhpcyBuZXcgYnVzeSBiZWhhdmlvciB3b3JraW5nIGFzIGludGVuZGVkPwo+IAo+ICAg
ICBQbGVhc2Ugbm90ZSB0aGF0IHRoZSBzaHJpbmtlciB3aWxsIG9ubHkgYmUgcmVnaXN0ZXJlZCBp
biBjYXNlIHdlIGhhdmUKPiAgICAgVklSVElPX0JBTExPT05fRl9ERUZMQVRFX09OX09PTSAtICh3
aGljaCBpcyBBRkFJSyB2ZXJ5IHJhcmUpIC0gdG8KPiAgICAgaW1wbGVtZW50IGF1dG9tYXRpYyBi
YWxsb29uIGRlZmxhdGlvbiB3aGVuIHRoZSBndWVzdCBpcyB1bmRlciBtZW1vcnkKPiAgICAgcHJl
c3N1cmUuCj4gCj4gCj4gICAgIEFyZSB5b3UgYWN0dWFsbHkgZXhwZXJpZW5jaW5nIGlzc3VlcyB3
aXRoIHRoYXQgb3IgZGlkIHlvdSBqdXN0IHN0dW1ibGUKPiAgICAgb3ZlciB0aGUgY29kZT8KPiAK
PiAKPiBXZSBoYXZlIGEgdXNlIGNhc2UgdGhhdCBpcyBlbmNvdW50ZXJpbmcgdGhpcyAoYW5kIHRo
YXQgcmVnaXN0ZXJzCj4gREVGTEFURV9PTl9PT00pLiBXZSBjYW4gd29yayBhcm91bmQgdGhpcywg
YnV0IGl0IGRvZXMgc2VlbSBpbmVmZmljaWVudC4KPiBJIHVuZGVyc3RhbmQgdGhlcmUgd2VyZSBn
b29kIHJlYXNvbnMgZm9yIG1vdmluZyBhd2F5IGZyb20gdGhlIE9PTQo+IG5vdGlmaWVyIGNhbGxi
YWNrLCBidXQgSSdtIHdvbmRlcmluZyBpZiB0aGUgYmFsbG9vbiBkcml2ZXIgY291bGQgc3BlY2lm
eQo+IGEgIm5pY2UiIGxldmVsIHRvIHRoZSBzaHJpbmtlciBBUEkgdGhhdCB3b3VsZCBjYXVzZSBp
dCB0byBiZSByZWNsYWltZWQKPiBmcm9tIG9ubHkgYXMgYSBsYXN0IHJlc29ydD8KPiDCoAoKQ2Mt
aW5nIGxpbnV4LW1tLCBNaWNoYWwgYW5kIE1pY2hhZWwuCgpKdXN0IHdvbmRlcmluZywgaG93IGRv
ZXMgeW91ciB3b3JrYXJvdW5kIGxvb2sgbGlrZT8KCi0tIApUaGFua3MsCgpEYXZpZCAvIGRoaWxk
ZW5iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
