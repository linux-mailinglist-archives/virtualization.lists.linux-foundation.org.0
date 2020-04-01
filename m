Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CF94D19AAAD
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 13:21:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 87974873D9;
	Wed,  1 Apr 2020 11:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c97bNhrNHrSK; Wed,  1 Apr 2020 11:21:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 847CE873CE;
	Wed,  1 Apr 2020 11:21:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D6E6C089F;
	Wed,  1 Apr 2020 11:21:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F5A0C089F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 11:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8B945873CB
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 11:21:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rW12REFbLmIQ
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 11:21:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C4977873C9
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 11:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585740103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cyECR4aJG/7CeIBblQy9M1dejlYBqUo0wJPVJet5SNA=;
 b=M/EDdOhy7GdPjBFtwHZ0DiXsBjpm/RGrA6Li2uF57jUWnHyGRYbXP37ch/W/c+5jGqn4bz
 44TwjTOthMSrH5zB9rXLfXcCjURbl0J9fTwtY3b03awOLw6uB8BzrgTCvkOmljrSUg5BPg
 BbZVSlQCa2YI3S5dlaPxPlM+uSaR5E0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-QxhtB1ISNFmLfsksWmjf3w-1; Wed, 01 Apr 2020 07:21:39 -0400
X-MC-Unique: QxhtB1ISNFmLfsksWmjf3w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8F0C8014D7;
 Wed,  1 Apr 2020 11:21:37 +0000 (UTC)
Received: from [10.36.114.59] (ovpn-114-59.ams2.redhat.com [10.36.114.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BA6E19C6A;
 Wed,  1 Apr 2020 11:21:29 +0000 (UTC)
Subject: Re: [RFC for Linux] virtio_balloon: Add VIRTIO_BALLOON_F_THP_ORDER to
 handle THP spilt issue
To: Nadav Amit <namit@vmware.com>
References: <20200326031817-mutt-send-email-mst@kernel.org>
 <C4C6BAF7-C040-403D-997C-48C7AB5A7D6B@redhat.com>
 <20200326054554-mutt-send-email-mst@kernel.org>
 <f26dc94a-7296-90c9-56cd-4586b78bc03d@redhat.com>
 <20200331091718-mutt-send-email-mst@kernel.org>
 <02a393ce-c4b4-ede9-7671-76fa4c19097a@redhat.com>
 <DD651B97-C7C2-4071-BD8D-EB5BC00A3A52@vmware.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <de0371da-3bf8-7873-559d-665a0e7c0fc5@redhat.com>
Date: Wed, 1 Apr 2020 13:21:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <DD651B97-C7C2-4071-BD8D-EB5BC00A3A52@vmware.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: "pagupta@redhat.com" <pagupta@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "mojha@codeaurora.org" <mojha@codeaurora.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 LKML <linux-kernel@vger.kernel.org>, Hui Zhu <teawaterz@linux.alibaba.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
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

T24gMzEuMDMuMjAgMTg6MjcsIE5hZGF2IEFtaXQgd3JvdGU6Cj4+IE9uIE1hciAzMSwgMjAyMCwg
YXQgNjozMiBBTSwgRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+IHdyb3RlOgo+
Pgo+PiBPbiAzMS4wMy4yMCAxNToyNCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+Pj4gT24g
VHVlLCBNYXIgMzEsIDIwMjAgYXQgMTI6MzU6MjRQTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJhbmQg
d3JvdGU6Cj4+Pj4gT24gMjYuMDMuMjAgMTA6NDksIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToK
Pj4+Pj4gT24gVGh1LCBNYXIgMjYsIDIwMjAgYXQgMDg6NTQ6MDRBTSArMDEwMCwgRGF2aWQgSGls
ZGVuYnJhbmQgd3JvdGU6Cj4+Pj4+Pj4gQW0gMjYuMDMuMjAyMCB1bSAwODoyMSBzY2hyaWViIE1p
Y2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Ogo+Pj4+Pj4+Cj4+Pj4+Pj4g77u/T24g
VGh1LCBNYXIgMTIsIDIwMjAgYXQgMDk6NTE6MjVBTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJhbmQg
d3JvdGU6Cj4+Pj4+Pj4+PiBPbiAxMi4wMy4yMCAwOTo0NywgTWljaGFlbCBTLiBUc2lya2luIHdy
b3RlOgo+Pj4+Pj4+Pj4gT24gVGh1LCBNYXIgMTIsIDIwMjAgYXQgMDk6Mzc6MzJBTSArMDEwMCwg
RGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+Pj4+Pj4+Pj4gMi4gWW91IGFyZSBlc3NlbnRpYWxs
eSBzdGVhbGluZyBUSFBzIGluIHRoZSBndWVzdC4gU28gdGhlIGZhc3Rlc3QKPj4+Pj4+Pj4+PiBt
YXBwaW5nIChUSFAgaW4gZ3Vlc3QgYW5kIGhvc3QpIGlzIGdvbmUuIFRoZSBndWVzdCB3b24ndCBi
ZSBhYmxlIHRvIG1ha2UKPj4+Pj4+Pj4+PiB1c2Ugb2YgVEhQIHdoZXJlIGl0IHByZXZpb3VzbHkg
d2FzIGFibGUgdG8uIEkgY2FuIGltYWdpbmUgdGhpcyBpbXBsaWVzIGEKPj4+Pj4+Pj4+PiBwZXJm
b3JtYW5jZSBkZWdyYWRhdGlvbiBmb3Igc29tZSB3b3JrbG9hZHMuIFRoaXMgbmVlZHMgYSBwcm9w
ZXIKPj4+Pj4+Pj4+PiBwZXJmb3JtYW5jZSBldmFsdWF0aW9uLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
IEkgdGhpbmsgdGhlIHByb2JsZW0gaXMgbW9yZSB3aXRoIHRoZSBhbGxvY19wYWdlcyBBUEkuCj4+
Pj4+Pj4+PiBUaGF0IGdpdmVzIHlvdSBleGFjdGx5IHRoZSBnaXZlbiBvcmRlciwgYW5kIGlmIHRo
ZXJlJ3MKPj4+Pj4+Pj4+IGEgbGFyZ2VyIGNodW5rIGF2YWlsYWJsZSwgaXQgd2lsbCBzcGxpdCBp
dCB1cC4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBCdXQgZm9yIGJhbGxvb24gLSBJIHN1c3BlY3QgbG90
cyBvZiBvdGhlciB1c2VycywKPj4+Pj4+Pj4+IHdlIGRvIG5vdCB3YW50IHRvIHN0cmVzcyB0aGUg
c3lzdGVtIGJ1dCBpZiBhIGxhcmdlCj4+Pj4+Pj4+PiBjaHVuayBpcyBhdmFpbGFibGUgYW55d2F5
LCB0aGVuIHdlIGNvdWxkIGhhbmRsZQo+Pj4+Pj4+Pj4gdGhhdCBtb3JlIG9wdGltYWxseSBieSBn
ZXR0aW5nIGl0IGFsbCBpbiBvbmUgZ28uCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFNv
IGlmIHdlIHdhbnQgdG8gYWRkcmVzcyB0aGlzLCBJTUhPIHRoaXMgY2FsbHMgZm9yIGEgbmV3IEFQ
SS4KPj4+Pj4+Pj4+IEFsb25nIHRoZSBsaW5lcyBvZgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+ICAgc3Ry
dWN0IHBhZ2UgKmFsbG9jX3BhZ2VfcmFuZ2UoZ2ZwX3QgZ2ZwLCB1bnNpZ25lZCBpbnQgbWluX29y
ZGVyLAo+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG1heF9vcmRlciwg
dW5zaWduZWQgaW50ICpvcmRlcikKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiB0aGUgaWRlYSB3b3VsZCB0
aGVuIGJlIHRvIHJldHVybiBhdCBhIG51bWJlciBvZiBwYWdlcyBpbiB0aGUgZ2l2ZW4KPj4+Pj4+
Pj4+IHJhbmdlLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFdoYXQgZG8geW91IHRoaW5rPyBXYW50IHRv
IHRyeSBpbXBsZW1lbnRpbmcgdGhhdD8KPj4+Pj4+Pj4KPj4+Pj4+Pj4gWW91IGNhbiBqdXN0IHN0
YXJ0IHdpdGggdGhlIGhpZ2hlc3Qgb3JkZXIgYW5kIGRlY3JlbWVudCB0aGUgb3JkZXIgdW50aWwK
Pj4+Pj4+Pj4geW91ciBhbGxvY2F0aW9uIHN1Y2NlZWRzIHVzaW5nIGFsbG9jX3BhZ2VzKCksIHdo
aWNoIHdvdWxkIGJlIGVub3VnaCBmb3IKPj4+Pj4+Pj4gYSBmaXJzdCB2ZXJzaW9uLiBBdCBsZWFz
dCBJIGRvbid0IHNlZSB0aGUgaW1tZWRpYXRlIG5lZWQgZm9yIGEgbmV3Cj4+Pj4+Pj4+IGtlcm5l
bCBBUEkuCj4+Pj4+Pj4KPj4+Pj4+PiBPSyBJIHJlbWVtYmVyIG5vdy4gIFRoZSBwcm9ibGVtIGlz
IHdpdGggcmVjbGFpbS4gVW5sZXNzIHJlY2xhaW0gaXMKPj4+Pj4+PiBjb21wbGV0ZWx5IGRpc2Fi
bGVkLCBhbnkgb2YgdGhlc2UgY2FsbHMgY2FuIHNsZWVwLiBBZnRlciBpdCB3YWtlcyB1cCwKPj4+
Pj4+PiB3ZSB3b3VsZCBsaWtlIHRvIGdldCB0aGUgbGFyZ2VyIG9yZGVyIHRoYXQgaGFzIGJlY29t
ZSBhdmFpbGFibGUKPj4+Pj4+PiBtZWFud2hpbGUuCj4+Pj4+Pgo+Pj4+Pj4gWWVzLCBidXQgdGhh
dOKAmHMgYSBwdXJlIG9wdGltaXphdGlvbiBJTUhPLgo+Pj4+Pj4gU28gSSB0aGluayB3ZSBzaG91
bGQgZG8gYSB0cml2aWFsIGltcGxlbWVudGF0aW9uIGZpcnN0IGFuZCB0aGVuIHNlZSB3aGF0IHdl
IGdhaW4gZnJvbSBhIG5ldyBhbGxvY2F0b3IgQVBJLiBUaGVuIHdlIG1pZ2h0IGFsc28gYmUgYWJs
ZSB0byBqdXN0aWZ5IGl0IHVzaW5nIHJlYWwgbnVtYmVycy4KPj4+Pj4KPj4+Pj4gV2VsbCBob3cg
ZG8geW91IHByb3Bvc2UgaW1wbGVtZW50IHRoZSBuZWNlc3Nhcnkgc2VtYW50aWNzPwo+Pj4+PiBJ
IHRoaW5rIHdlIGFyZSBib3RoIGFncmVlZCB0aGF0IGFsbG9jX3BhZ2VfcmFuZ2UgaXMgbW9yZSBv
cgo+Pj4+PiBsZXNzIHdoYXQncyBuZWNlc3NhcnkgYW55d2F5IC0gc28gaG93IHdvdWxkIHlvdSBh
cHByb3hpbWF0ZSBpdAo+Pj4+PiBvbiB0b3Agb2YgZXhpc3RpbmcgQVBJcz8KPj4+Pgo+Pj4+IExv
b2tpbmcgYXQgZHJpdmVycy9taXNjL3Ztd19iYWxsb29uLmM6dm1iYWxsb29uX2luZmxhdGUoKSwg
aXQgZmlyc3QKPj4+PiB0cmllcyB0byBhbGxvY2F0ZSBodWdlIHBhZ2VzIHVzaW5nCj4+Pj4KPj4+
PiAJYWxsb2NfcGFnZXMoX19HRlBfSElHSE1FTXxfX0dGUF9OT1dBUk58IF9fR0ZQX05PTUVNQUxM
T0MsIAo+Pj4+ICAgICAgICAgICAgICAgICAgICBWTVdfQkFMTE9PTl8yTV9PUkRFUikKPj4+Pgo+
Pj4+IEFuZCB0aGVuIGZhbGxzIGJhY2sgdG8gNGsgYWxsb2NhdGlvbnMgKGJhbGxvb25fcGFnZV9h
bGxvYygpKSBpbiBjYXNlCj4+Pj4gYWxsb2NhdGlvbiBmYWlscy4KPj4+Pgo+Pj4+IEknbSByb3Vn
aGx5IHRoaW5raW5nIG9mIHNvbWV0aGluZyBsaWtlIHRoZSBmb2xsb3dpbmcsIGJ1dCB3aXRoIGFu
Cj4+Pj4gb3B0aW1pemVkIHJlcG9ydGluZyBpbnRlcmZhY2UvYmlnZ2VyIHBmbiBhcnJheSBzbyB3
ZSBjYW4gcmVwb3J0ID4KPj4+PiAxTUIgYXQgYSB0aW1lLiBBbHNvLCBpdCBtaWdodCBtYWtlIHNl
bnNlIHRvIHJlbWVtYmVyIHRoZSBvcmRlciB0aGF0Cj4+Pj4gc3VjY2VlZGVkIGFjcm9zcyBzb21l
IGZpbGxfYmFsbG9vbigpIGNhbGxzLgo+Pj4+Cj4+Pj4gRG9uJ3QgZXZlbiBleHBlY3QgaXQgdG8g
Y29tcGlsZSAuLi4KPj4+Pgo+Pj4+Cj4+Pj4KPj4+Pj4gRnJvbSA0MzA1Zjk4OTY3MmNjY2E0YmU5
MjkzZTZkNDE2N2U5MjlmM2UyOTliIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+Pj4+IEZyb206
IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgo+Pj4+IERhdGU6IFR1ZSwgMzEg
TWFyIDIwMjAgMTI6Mjg6MDcgKzAyMDAKPj4+PiBTdWJqZWN0OiBbUEFUQ0ggUkZDXSB0bXAKPj4+
Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29t
Pgo+Pj4+IC0tLQo+Pj4+IGRyaXZlcnMvdmlydGlvL3ZpcnRpb19iYWxsb29uLmMgICAgfCAzOCAr
KysrKysrKysrKysrKysrKystLS0tLS0tLQo+Pj4+IGluY2x1ZGUvbGludXgvYmFsbG9vbl9jb21w
YWN0aW9uLmggfCAgNyArKysrLQo+Pj4+IG1tL2JhbGxvb25fY29tcGFjdGlvbi5jICAgICAgICAg
ICAgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KPj4+PiAzIGZpbGVzIGNoYW5n
ZWQsIDY3IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19iYWxsb29uLmMgYi9kcml2ZXJzL3ZpcnRpby92aXJ0
aW9fYmFsbG9vbi5jCj4+Pj4gaW5kZXggODUxMWQyNThkYmI0Li4wNjYwYjFiOTg4ZjAgMTAwNjQ0
Cj4+Pj4gLS0tIGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYwo+Pj4+ICsrKyBiL2Ry
aXZlcnMvdmlydGlvL3ZpcnRpb19iYWxsb29uLmMKPj4+PiBAQCAtMTg3LDcgKzE4Nyw3IEBAIGlu
dCB2aXJ0YmFsbG9vbl9mcmVlX3BhZ2VfcmVwb3J0KHN0cnVjdCBwYWdlX3JlcG9ydGluZ19kZXZf
aW5mbyAqcHJfZGV2X2luZm8sCj4+Pj4gfQo+Pj4+Cj4+Pj4gc3RhdGljIHZvaWQgc2V0X3BhZ2Vf
cGZucyhzdHJ1Y3QgdmlydGlvX2JhbGxvb24gKnZiLAo+Pj4+IC0JCQkgIF9fdmlydGlvMzIgcGZu
c1tdLCBzdHJ1Y3QgcGFnZSAqcGFnZSkKPj4+PiArCQkJICBfX3ZpcnRpbzMyIHBmbnNbXSwgc3Ry
dWN0IHBhZ2UgKnBhZ2UsIGludCBvcmRlcikKPj4+PiB7Cj4+Pj4gCXVuc2lnbmVkIGludCBpOwo+
Pj4+Cj4+Pj4gQEAgLTE5Nyw3ICsxOTcsNyBAQCBzdGF0aWMgdm9pZCBzZXRfcGFnZV9wZm5zKHN0
cnVjdCB2aXJ0aW9fYmFsbG9vbiAqdmIsCj4+Pj4gCSAqIFNldCBiYWxsb29uIHBmbnMgcG9pbnRp
bmcgYXQgdGhpcyBwYWdlLgo+Pj4+IAkgKiBOb3RlIHRoYXQgdGhlIGZpcnN0IHBmbiBwb2ludHMg
YXQgc3RhcnQgb2YgdGhlIHBhZ2UuCj4+Pj4gCSAqLwo+Pj4+IC0JZm9yIChpID0gMDsgaSA8IFZJ
UlRJT19CQUxMT09OX1BBR0VTX1BFUl9QQUdFOyBpKyspCj4+Pj4gKwlmb3IgKGkgPSAwOyBpIDwg
VklSVElPX0JBTExPT05fUEFHRVNfUEVSX1BBR0UgKiAoMSA8PCBvcmRlcik7IGkrKykKPj4+PiAJ
CXBmbnNbaV0gPSBjcHVfdG9fdmlydGlvMzIodmItPnZkZXYsCj4+Pj4gCQkJCQkgIHBhZ2VfdG9f
YmFsbG9vbl9wZm4ocGFnZSkgKyBpKTsKPj4+PiB9Cj4+Pj4gQEAgLTIwNSw2ICsyMDUsNyBAQCBz
dGF0aWMgdm9pZCBzZXRfcGFnZV9wZm5zKHN0cnVjdCB2aXJ0aW9fYmFsbG9vbiAqdmIsCj4+Pj4g
c3RhdGljIHVuc2lnbmVkIGZpbGxfYmFsbG9vbihzdHJ1Y3QgdmlydGlvX2JhbGxvb24gKnZiLCBz
aXplX3QgbnVtKQo+Pj4+IHsKPj4+PiAJdW5zaWduZWQgbnVtX2FsbG9jYXRlZF9wYWdlczsKPj4+
PiArCWludCBvcmRlciA9IE1BWF9PUkRFUiAtIDE7Cj4+Pj4gCXVuc2lnbmVkIG51bV9wZm5zOwo+
Pj4+IAlzdHJ1Y3QgcGFnZSAqcGFnZTsKPj4+PiAJTElTVF9IRUFEKHBhZ2VzKTsKPj4+PiBAQCAt
MjEyLDkgKzIxMywyMCBAQCBzdGF0aWMgdW5zaWduZWQgZmlsbF9iYWxsb29uKHN0cnVjdCB2aXJ0
aW9fYmFsbG9vbiAqdmIsIHNpemVfdCBudW0pCj4+Pj4gCS8qIFdlIGNhbiBvbmx5IGRvIG9uZSBh
cnJheSB3b3J0aCBhdCBhIHRpbWUuICovCj4+Pj4gCW51bSA9IG1pbihudW0sIEFSUkFZX1NJWkUo
dmItPnBmbnMpKTsKPj4+Pgo+Pj4+ICsJLyoKPj4+PiArCSAqIE5vdGU6IHdlIHdpbGwgY3VycmVu
dGx5IG5ldmVyIGFsbG9jYXRlIG1vcmUgdGhhbiAxTUIgZHVlIHRvIHRoZQo+Pj4+ICsJICogcGZu
IGFycmF5IHNpemUsIHNvIHdlIHdpbGwgbm90IGFsbG9jYXRlIE1BWF9PUkRFUiAtIDEgLi4uCj4+
Pj4gKwkgKi8KPj4+PiArCj4+Pj4gCWZvciAobnVtX3BmbnMgPSAwOyBudW1fcGZucyA8IG51bTsK
Pj4+PiAtCSAgICAgbnVtX3BmbnMgKz0gVklSVElPX0JBTExPT05fUEFHRVNfUEVSX1BBR0UpIHsK
Pj4+PiAtCQlzdHJ1Y3QgcGFnZSAqcGFnZSA9IGJhbGxvb25fcGFnZV9hbGxvYygpOwo+Pj4+ICsJ
ICAgICBudW1fcGZucyArPSBWSVJUSU9fQkFMTE9PTl9QQUdFU19QRVJfUEFHRSAqICgxIDw8IG9y
ZGVyKSkgewo+Pj4+ICsJCWNvbnN0IHVuc2lnbmVkIGxvbmcgcmVtYWluaW5nID0gbnVtIC0gbnVt
X3BmbnM7Cj4+Pj4gKwo+Pj4+ICsJCW9yZGVyID0gTUlOKG9yZGVyLAo+Pj4+ICsJCQkgICAgZ2V0
X29yZGVyKHJlbWFpbmluZyA8PCBWSVJUSU9fQkFMTE9PTl9QRk5fU0hJRlQpKTsKPj4+PiArCQlp
ZiAoKDEgPDwgb3JkZXIpICogVklSVElPX0JBTExPT05fUEFHRVNfUEVSX1BBR0UgPiByZW1haW5p
bmcpCj4+Pj4gKwkJCW9yZGVyLS07Cj4+Pj4gKwkJcGFnZSA9IGJhbGxvb25fcGFnZXNfYWxsb2Mo
b3JkZXIpOwo+Pj4+Cj4+Pj4gCQlpZiAoIXBhZ2UpIHsKPj4+PiAJCQlkZXZfaW5mb19yYXRlbGlt
aXRlZCgmdmItPnZkZXYtPmRldiwKPj4+PiBAQCAtMjI1LDYgKzIzNyw4IEBAIHN0YXRpYyB1bnNp
Z25lZCBmaWxsX2JhbGxvb24oc3RydWN0IHZpcnRpb19iYWxsb29uICp2Yiwgc2l6ZV90IG51bSkK
Pj4+PiAJCQlicmVhazsKPj4+PiAJCX0KPj4+Pgo+Pj4+ICsJCS8qIENvbnRpbnVlIHdpdGggdGhl
IGFjdHVhbCBvcmRlciB0aGF0IHN1Y2NlZWRlZC4gKi8KPj4+PiArCQlvcmRlciA9IHBhZ2VfcHJp
dmF0ZShwYWdlKTsKPj4+PiAJCWJhbGxvb25fcGFnZV9wdXNoKCZwYWdlcywgcGFnZSk7Cj4+Pj4g
CX0KPj4+Pgo+Pj4+IEBAIC0yMzMsMTQgKzI0NywxNiBAQCBzdGF0aWMgdW5zaWduZWQgZmlsbF9i
YWxsb29uKHN0cnVjdCB2aXJ0aW9fYmFsbG9vbiAqdmIsIHNpemVfdCBudW0pCj4+Pj4gCXZiLT5u
dW1fcGZucyA9IDA7Cj4+Pj4KPj4+PiAJd2hpbGUgKChwYWdlID0gYmFsbG9vbl9wYWdlX3BvcCgm
cGFnZXMpKSkgewo+Pj4+ICsJCW9yZGVyID0gcGFnZV9vcmRlcihwYWdlKTsKPj4+PiArCQkvKiBl
bnF1ZXVpbmcgd2lsbCBzcGxpdCB0aGUgcGFnZSBhbmQgY2xlYXIgdGhlIG9yZGVyICovCj4+Pj4g
CQliYWxsb29uX3BhZ2VfZW5xdWV1ZSgmdmItPnZiX2Rldl9pbmZvLCBwYWdlKTsKPj4+Pgo+Pj4+
IC0JCXNldF9wYWdlX3BmbnModmIsIHZiLT5wZm5zICsgdmItPm51bV9wZm5zLCBwYWdlKTsKPj4+
PiAtCQl2Yi0+bnVtX3BhZ2VzICs9IFZJUlRJT19CQUxMT09OX1BBR0VTX1BFUl9QQUdFOwo+Pj4+
ICsJCXNldF9wYWdlX3BmbnModmIsIHZiLT5wZm5zICsgdmItPm51bV9wZm5zLCBwYWdlLCBvcmRl
cik7Cj4+Pj4gKwkJdmItPm51bV9wYWdlcyArPSBWSVJUSU9fQkFMTE9PTl9QQUdFU19QRVJfUEFH
RSAqICgxIDw8IG9yZGVyKTsKPj4+PiAJCWlmICghdmlydGlvX2hhc19mZWF0dXJlKHZiLT52ZGV2
LAo+Pj4+IAkJCQkJVklSVElPX0JBTExPT05fRl9ERUZMQVRFX09OX09PTSkpCj4+Pj4gLQkJCWFk
anVzdF9tYW5hZ2VkX3BhZ2VfY291bnQocGFnZSwgLTEpOwo+Pj4+IC0JCXZiLT5udW1fcGZucyAr
PSBWSVJUSU9fQkFMTE9PTl9QQUdFU19QRVJfUEFHRTsKPj4+PiArCQkJYWRqdXN0X21hbmFnZWRf
cGFnZV9jb3VudChwYWdlLCAtMSAqICgxIDw8IG9yZGVyKSk7Cj4+Pj4gKwkJdmItPm51bV9wZm5z
ICs9IFZJUlRJT19CQUxMT09OX1BBR0VTX1BFUl9QQUdFICogKDEgPDwgb3JkZXIpOwo+Pj4+IAl9
Cj4+Pj4KPj4+PiAJbnVtX2FsbG9jYXRlZF9wYWdlcyA9IHZiLT5udW1fcGZuczsKPj4+PiBAQCAt
Mjg0LDcgKzMwMCw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsZWFrX2JhbGxvb24oc3RydWN0IHZpcnRp
b19iYWxsb29uICp2Yiwgc2l6ZV90IG51bSkKPj4+PiAJCXBhZ2UgPSBiYWxsb29uX3BhZ2VfZGVx
dWV1ZSh2Yl9kZXZfaW5mbyk7Cj4+Pj4gCQlpZiAoIXBhZ2UpCj4+Pj4gCQkJYnJlYWs7Cj4+Pj4g
LQkJc2V0X3BhZ2VfcGZucyh2YiwgdmItPnBmbnMgKyB2Yi0+bnVtX3BmbnMsIHBhZ2UpOwo+Pj4+
ICsJCXNldF9wYWdlX3BmbnModmIsIHZiLT5wZm5zICsgdmItPm51bV9wZm5zLCBwYWdlLCAwKTsK
Pj4+PiAJCWxpc3RfYWRkKCZwYWdlLT5scnUsICZwYWdlcyk7Cj4+Pj4gCQl2Yi0+bnVtX3BhZ2Vz
IC09IFZJUlRJT19CQUxMT09OX1BBR0VTX1BFUl9QQUdFOwo+Pj4+IAl9Cj4+Pj4gQEAgLTc4Niw3
ICs4MDIsNyBAQCBzdGF0aWMgaW50IHZpcnRiYWxsb29uX21pZ3JhdGVwYWdlKHN0cnVjdCBiYWxs
b29uX2Rldl9pbmZvICp2Yl9kZXZfaW5mbywKPj4+PiAJX19jb3VudF92bV9ldmVudChCQUxMT09O
X01JR1JBVEUpOwo+Pj4+IAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ2Yl9kZXZfaW5mby0+cGFn
ZXNfbG9jaywgZmxhZ3MpOwo+Pj4+IAl2Yi0+bnVtX3BmbnMgPSBWSVJUSU9fQkFMTE9PTl9QQUdF
U19QRVJfUEFHRTsKPj4+PiAtCXNldF9wYWdlX3BmbnModmIsIHZiLT5wZm5zLCBuZXdwYWdlKTsK
Pj4+PiArCXNldF9wYWdlX3BmbnModmIsIHZiLT5wZm5zLCBuZXdwYWdlLCAwKTsKPj4+PiAJdGVs
bF9ob3N0KHZiLCB2Yi0+aW5mbGF0ZV92cSk7Cj4+Pj4KPj4+PiAJLyogYmFsbG9vbidzIHBhZ2Ug
bWlncmF0aW9uIDJuZCBzdGVwIC0tIGRlZmxhdGUgInBhZ2UiICovCj4+Pj4gQEAgLTc5NCw3ICs4
MTAsNyBAQCBzdGF0aWMgaW50IHZpcnRiYWxsb29uX21pZ3JhdGVwYWdlKHN0cnVjdCBiYWxsb29u
X2Rldl9pbmZvICp2Yl9kZXZfaW5mbywKPj4+PiAJYmFsbG9vbl9wYWdlX2RlbGV0ZShwYWdlKTsK
Pj4+PiAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmdmJfZGV2X2luZm8tPnBhZ2VzX2xvY2ssIGZs
YWdzKTsKPj4+PiAJdmItPm51bV9wZm5zID0gVklSVElPX0JBTExPT05fUEFHRVNfUEVSX1BBR0U7
Cj4+Pj4gLQlzZXRfcGFnZV9wZm5zKHZiLCB2Yi0+cGZucywgcGFnZSk7Cj4+Pj4gKwlzZXRfcGFn
ZV9wZm5zKHZiLCB2Yi0+cGZucywgcGFnZSwgMCk7Cj4+Pj4gCXRlbGxfaG9zdCh2YiwgdmItPmRl
ZmxhdGVfdnEpOwo+Pj4+Cj4+Pj4gCW11dGV4X3VubG9jaygmdmItPmJhbGxvb25fbG9jayk7Cj4+
Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvYmFsbG9vbl9jb21wYWN0aW9uLmggYi9pbmNs
dWRlL2xpbnV4L2JhbGxvb25fY29tcGFjdGlvbi5oCj4+Pj4gaW5kZXggMzM4YWEyN2U0NzczLi5l
ZDkzZmU1NzA0ZDEgMTAwNjQ0Cj4+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9iYWxsb29uX2NvbXBh
Y3Rpb24uaAo+Pj4+ICsrKyBiL2luY2x1ZGUvbGludXgvYmFsbG9vbl9jb21wYWN0aW9uLmgKPj4+
PiBAQCAtNjAsNyArNjAsNyBAQCBzdHJ1Y3QgYmFsbG9vbl9kZXZfaW5mbyB7Cj4+Pj4gCXN0cnVj
dCBpbm9kZSAqaW5vZGU7Cj4+Pj4gfTsKPj4+Pgo+Pj4+IC1leHRlcm4gc3RydWN0IHBhZ2UgKmJh
bGxvb25fcGFnZV9hbGxvYyh2b2lkKTsKPj4+PiArZXh0ZXJuIHN0cnVjdCBwYWdlICpiYWxsb29u
X3BhZ2VzX2FsbG9jKGludCBvcmRlcik7Cj4+Pj4gZXh0ZXJuIHZvaWQgYmFsbG9vbl9wYWdlX2Vu
cXVldWUoc3RydWN0IGJhbGxvb25fZGV2X2luZm8gKmJfZGV2X2luZm8sCj4+Pj4gCQkJCSBzdHJ1
Y3QgcGFnZSAqcGFnZSk7Cj4+Pj4gZXh0ZXJuIHN0cnVjdCBwYWdlICpiYWxsb29uX3BhZ2VfZGVx
dWV1ZShzdHJ1Y3QgYmFsbG9vbl9kZXZfaW5mbyAqYl9kZXZfaW5mbyk7Cj4+Pj4gQEAgLTc4LDYg
Kzc4LDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBiYWxsb29uX2RldmluZm9faW5pdChzdHJ1Y3Qg
YmFsbG9vbl9kZXZfaW5mbyAqYmFsbG9vbikKPj4+PiAJYmFsbG9vbi0+aW5vZGUgPSBOVUxMOwo+
Pj4+IH0KPj4+Pgo+Pj4+ICtzdGF0aWMgaW5saW5lIHN0cnVjdCBwYWdlICpiYWxsb29uX3BhZ2Vf
YWxsb2Modm9pZCkKPj4+PiArewo+Pj4+ICsJcmV0dXJuIGJhbGxvb25fcGFnZXNfYWxsb2MoMCk7
Cj4+Pj4gK30KPj4+PiArCj4+Pj4gI2lmZGVmIENPTkZJR19CQUxMT09OX0NPTVBBQ1RJT04KPj4+
PiBleHRlcm4gY29uc3Qgc3RydWN0IGFkZHJlc3Nfc3BhY2Vfb3BlcmF0aW9ucyBiYWxsb29uX2Fv
cHM7Cj4+Pj4gZXh0ZXJuIGJvb2wgYmFsbG9vbl9wYWdlX2lzb2xhdGUoc3RydWN0IHBhZ2UgKnBh
Z2UsCj4+Pj4gZGlmZiAtLWdpdCBhL21tL2JhbGxvb25fY29tcGFjdGlvbi5jIGIvbW0vYmFsbG9v
bl9jb21wYWN0aW9uLmMKPj4+PiBpbmRleCAyNmRlMDIwYWFlN2IuLjA2NzgxMGIzMjgxMyAxMDA2
NDQKPj4+PiAtLS0gYS9tbS9iYWxsb29uX2NvbXBhY3Rpb24uYwo+Pj4+ICsrKyBiL21tL2JhbGxv
b25fY29tcGFjdGlvbi5jCj4+Pj4gQEAgLTExMiwyMyArMTEyLDM1IEBAIHNpemVfdCBiYWxsb29u
X3BhZ2VfbGlzdF9kZXF1ZXVlKHN0cnVjdCBiYWxsb29uX2Rldl9pbmZvICpiX2Rldl9pbmZvLAo+
Pj4+IEVYUE9SVF9TWU1CT0xfR1BMKGJhbGxvb25fcGFnZV9saXN0X2RlcXVldWUpOwo+Pj4+Cj4+
Pj4gLyoKPj4+PiAtICogYmFsbG9vbl9wYWdlX2FsbG9jIC0gYWxsb2NhdGVzIGEgbmV3IHBhZ2Ug
Zm9yIGluc2VydGlvbiBpbnRvIHRoZSBiYWxsb29uCj4+Pj4gLSAqCQkJcGFnZSBsaXN0Lgo+Pj4+
ICsgKiBiYWxsb29uX3BhZ2VzX2FsbG9jIC0gYWxsb2NhdGVzIGEgbmV3IHBhZ2UgKG9mIGF0IG1v
c3QgdGhlIGdpdmVuIG9yZGVyKQo+Pj4+ICsgKiAJCQkgZm9yIGluc2VydGlvbiBpbnRvIHRoZSBi
YWxsb29uIHBhZ2UgbGlzdC4KPj4+PiAgKgo+Pj4+ICAqIERyaXZlciBtdXN0IGNhbGwgdGhpcyBm
dW5jdGlvbiB0byBwcm9wZXJseSBhbGxvY2F0ZSBhIG5ldyBiYWxsb29uIHBhZ2UuCj4+Pj4gICog
RHJpdmVyIG11c3QgY2FsbCBiYWxsb29uX3BhZ2VfZW5xdWV1ZSBiZWZvcmUgZGVmaW5pdGl2ZWx5
IHJlbW92aW5nIHRoZSBwYWdlCj4+Pj4gICogZnJvbSB0aGUgZ3Vlc3Qgc3lzdGVtLgo+Pj4+ICAq
Cj4+Pj4gKyAqIFdpbGwgZmFsbCBiYWNrIHRvIHNtYWxsZXIgb3JkZXJzIGlmIGFsbG9jYXRpb24g
ZmFpbHMuIFRoZSBvcmRlciBvZiB0aGUKPj4+PiArICogYWxsb2NhdGVkIHBhZ2UgaXMgc3RvcmVk
IGluIHBhZ2UtPnByaXZhdGUuCj4+Pj4gKyAqCj4+Pj4gICogUmV0dXJuOiBzdHJ1Y3QgcGFnZSBm
b3IgdGhlIGFsbG9jYXRlZCBwYWdlIG9yIE5VTEwgb24gYWxsb2NhdGlvbiBmYWlsdXJlLgo+Pj4+
ICAqLwo+Pj4+IC1zdHJ1Y3QgcGFnZSAqYmFsbG9vbl9wYWdlX2FsbG9jKHZvaWQpCj4+Pj4gK3N0
cnVjdCBwYWdlICpiYWxsb29uX3BhZ2VzX2FsbG9jKGludCBvcmRlcikKPj4+PiB7Cj4+Pj4gLQlz
dHJ1Y3QgcGFnZSAqcGFnZSA9IGFsbG9jX3BhZ2UoYmFsbG9vbl9tYXBwaW5nX2dmcF9tYXNrKCkg
fAo+Pj4+IC0JCQkJICAgICAgIF9fR0ZQX05PTUVNQUxMT0MgfCBfX0dGUF9OT1JFVFJZIHwKPj4+
PiAtCQkJCSAgICAgICBfX0dGUF9OT1dBUk4pOwo+Pj4+IC0JcmV0dXJuIHBhZ2U7Cj4+Pj4gKwlz
dHJ1Y3QgcGFnZSAqcGFnZTsKPj4+PiArCj4+Pj4gKwl3aGlsZSAob3JkZXIgPj0gMCkgewo+Pj4+
ICsJCXBhZ2UgPSBhbGxvY19wYWdlcyhiYWxsb29uX21hcHBpbmdfZ2ZwX21hc2soKSB8Cj4+Pj4g
KwkJCQkgICBfX0dGUF9OT01FTUFMTE9DIHwgX19HRlBfTk9SRVRSWSB8Cj4+Pj4gKwkJCQkgICBf
X0dGUF9OT1dBUk4sIG9yZGVyKTsKPj4+PiArCQlpZiAocGFnZSkgewo+Pj4+ICsJCQlzZXRfcGFn
ZV9wcml2YXRlKHBhZ2UsIG9yZGVyKTsKPj4+PiArCQkJcmV0dXJuIHBhZ2U7Cj4+Pj4gKwkJfQo+
Pj4+ICsJCW9yZGVyLS07Cj4+Pj4gKwl9Cj4+Pj4gKwlyZXR1cm4gTlVMTDsKPj4+PiB9Cj4+Pj4g
LUVYUE9SVF9TWU1CT0xfR1BMKGJhbGxvb25fcGFnZV9hbGxvYyk7Cj4+Pj4gK0VYUE9SVF9TWU1C
T0xfR1BMKGJhbGxvb25fcGFnZXNfYWxsb2MpOwo+Pj4+Cj4+Pj4gLyoKPj4+PiAgKiBiYWxsb29u
X3BhZ2VfZW5xdWV1ZSAtIGluc2VydHMgYSBuZXcgcGFnZSBpbnRvIHRoZSBiYWxsb29uIHBhZ2Ug
bGlzdC4KPj4+Cj4+Pgo+Pj4gSSB0aGluayB0aGlzIHdpbGwgdHJ5IHRvIGludm9rZSBkaXJlY3Qg
cmVjbGFpbSBmcm9tIHRoZSBmaXJzdCBpdGVyYXRpb24KPj4+IHRvIGZyZWUgdXAgdGhlIG1heCBv
cmRlci4KPj4KPj4gJV9fR0ZQX05PUkVUUlk6IFRoZSBWTSBpbXBsZW1lbnRhdGlvbiB3aWxsIHRy
eSBvbmx5IHZlcnkgbGlnaHR3ZWlnaHQKPj4gbWVtb3J5IGRpcmVjdCByZWNsYWltIHRvIGdldCBz
b21lIG1lbW9yeSB1bmRlciBtZW1vcnkgcHJlc3N1cmUgKHRodXMgaXQKPj4gY2FuIHNsZWVwKS4g
SXQgd2lsbCBhdm9pZCBkaXNydXB0aXZlIGFjdGlvbnMgbGlrZSBPT00ga2lsbGVyLgo+Pgo+PiBD
ZXJ0YWlubHkgZ29vZCBlbm91Z2ggZm9yIGEgZmlyc3QgdmVyc2lvbiBJIHdvdWxkIHNheSwgbm8/
IExvb2tpbmcgYXQKPj4gdGhlIHZtd2FyZSBiYWxsb29uLCB0aGV5IGRvbid0IGV2ZW4gc2V0IF9f
R0ZQX05PUkVUUlkuCj4gCj4gWWVzLCBpdCBkb2VzIHNlZW0gdGhhdCB3ZSBhcmUgbWlzc2luZyBf
X0dGUF9OT1JFVFJZLiBJIHJlYWxseSBkbyBub3Qga25vdwo+IHdoYXQgSSB3YXMgdGhpbmtpbmcg
d2hlbiBJIGRpZCBub3QgYWRkIGl0IGZvciBodWdlLXBhZ2VzIGFsbG9jYXRpb24uIEkgd2lsbAo+
IHNlbmQgYSBwYXRjaC4gVGhhbmtzIGZvciBub3RpY2luZyA6KQo+IAo+IEluIHJlZ2FyZCB0byB5
b3VyIHBhdGNoLCBJIHdvdWxkIGJlIGhhcHB5IHRvIGNvbnNvbGlkYXRlIHRoZSBhbGxvY2F0aW9u
Cj4gbWVjaGFuaXNtcywgc28gVk13YXJlIGJhbGxvb24gZHJpdmVyIHdvdWxkIGFsc28gdXNlIHlv
dXIgY29kZS4gSW4gZ2VuZXJhbAo+IHlvdXIgY29kZSBsb29rcyBnb29kLCB0YWtlLWF3YXkgc29t
ZSBzdHlsZSBpc3N1ZXMuCgpZZWFoLCBsZXQncyBzZWUgaW4gd2hpY2ggZGlyZWN0aW9uIHdlJ2xs
IGJlIGJyaW5naW5nCmJhbGxvb25fcGFnZV9hbGxvYygpLCBJIHRoaW5rIHRoZXJlIGFyZSBzdGls
bCBzb21lIHF1ZXN0aW9ucyB0byBiZQphbnN3ZXJlZCAobW9zdGx5IHBlcmZvcm1hbmNlIGltcGxp
Y2F0aW9ucykuCgpDaGVlcnMhCgotLSAKVGhhbmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24g
bWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxp
emF0aW9u
