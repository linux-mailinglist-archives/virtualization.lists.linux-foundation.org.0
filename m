Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA6314C8C0
	for <lists.virtualization@lfdr.de>; Wed, 29 Jan 2020 11:31:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EDFBB88159;
	Wed, 29 Jan 2020 10:31:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eHnpGZAsd4Cn; Wed, 29 Jan 2020 10:31:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9D18D880CC;
	Wed, 29 Jan 2020 10:31:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F0ACC0171;
	Wed, 29 Jan 2020 10:31:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E084FC0171
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 10:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D752C84B80
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 10:31:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xc6hl65aXOhh
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 10:31:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0194C84B1C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 10:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580293894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kqcNPrGdsH3BFssSdLk6ifjiyVt9hlvbG+FY5NZg9SI=;
 b=eNxORviy/AJZdSImNN3X1AU2IEaY4ELowO/NxNgK3ZJNSSc7GoTsfWrR/49eI/2FkNVEmD
 WIYAZs47D3XSPPa1eLyx6GobXnkZtCXOHINBbwaOsYWNn4ZTE2fDIvBak3LjfC7c91Su18
 8+FtSstOePLSrptz9ngPkm8NRDaQrXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-eiwfRPZ7Nji_ZNaj_D9n_w-1; Wed, 29 Jan 2020 05:31:31 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F30D18C43C1;
 Wed, 29 Jan 2020 10:31:30 +0000 (UTC)
Received: from [10.36.118.36] (unknown [10.36.118.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6945188832;
 Wed, 29 Jan 2020 10:31:29 +0000 (UTC)
Subject: Re: Balloon pressuring page cache
To: Tyler Sanderson <tysand@google.com>,
 virtualization@lists.linux-foundation.org, Wei Wang <wei.w.wang@intel.com>,
 David Rientjes <rientjes@google.com>
References: <CAJuQAmpDUyve2S+oxp9tLUhuRcnddXnNztC5PmYOOCpY6c68xg@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <91270a68-ff48-88b0-219c-69801f0c252f@redhat.com>
Date: Wed, 29 Jan 2020 11:31:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAJuQAmpDUyve2S+oxp9tLUhuRcnddXnNztC5PmYOOCpY6c68xg@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: eiwfRPZ7Nji_ZNaj_D9n_w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

T24gMjkuMDEuMjAgMDE6MjIsIFR5bGVyIFNhbmRlcnNvbiB2aWEgVmlydHVhbGl6YXRpb24gd3Jv
dGU6Cj4gQSBwcmltYXJ5IGFkdmFudGFnZSBvZiB2aXJ0aW8gYmFsbG9vbiBvdmVyIG90aGVywqBt
ZW1vcnkgcmVjbGFpbQo+IG1lY2hhbmlzbXMgaXMgdGhhdCBpdCBjYW7CoHByZXNzdXJlIHRoZSBn
dWVzdCdzIHBhZ2UgY2FjaGUgaW50byBzaHJpbmtpbmcuCj4gCj4gSG93ZXZlciwgc2luY2UgdGhl
IGJhbGxvb24gZHJpdmVyIGNoYW5nZWQgdG8gdXNpbmcgdGhlIHNocmlua2VyIEFQSQo+IDxodHRw
czovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0LzcxOTk0NjIwYmIyNWE4YjEwOTM4
OGZlZmE5ZTk5YTI4ZTM1NTI1NWEjZGlmZi1mZDIwMmFjZjY5NGQ5ZWJhMTljOGM2NGRhM2U0ODBj
OT7CoHRoaXMKPiB1c2UgY2FzZSBoYXMgYmVjb21lIGEgYml0IG1vcmUgdHJpY2t5LiBJJ20gd29u
ZGVyaW5nIHdoYXQgdGhlIGludGVuZGVkCj4gZGV2aWNlIGltcGxlbWVudGF0aW9uIGlzLgo+IAo+
IFdoZW4gaW5mbGF0aW5nIHRoZSBiYWxsb29uIGFnYWluc3QgcGFnZSBjYWNoZSAoaS5lLiBubyBm
cmVlIG1lbW9yeQo+IHJlbWFpbnMpIHZtc2Nhbi5jIHdpbGwgYm90aCBzaHJpbmsgcGFnZSBjYWNo
ZSwgYnV0IGFsc28gaW52b2tlIHRoZQo+IHNocmlua2VycyAtLSBpbmNsdWRpbmcgdGhlIGJhbGxv
b24ncyBzaHJpbmtlci4gU28gdGhlIGJhbGxvb24gZHJpdmVyCj4gYWxsb2NhdGVzIG1lbW9yeSB3
aGljaCByZXF1aXJlcyByZWNsYWltLCB2bXNjYW4gZ2V0cyB0aGlzIG1lbW9yeSBieQo+IHNocmlu
a2luZyB0aGUgYmFsbG9vbiwgYW5kIHRoZW4gdGhlIGRyaXZlciBhZGRzIHRoZSBtZW1vcnkgYmFj
ayB0byB0aGUKPiBiYWxsb29uLiBCYXNpY2FsbHkgYSBidXN5IG5vLW9wLgo+IAo+IElmIGZpbGUg
SU8gaXMgb25nb2luZyBkdXJpbmcgdGhpcyBiYWxsb29uIGluZmxhdGlvbiB0aGVuIHRoZSBwYWdl
IGNhY2hlCj4gY291bGQgYmUgZ3Jvd2luZyB3aGljaCBmdXJ0aGVyIHB1dHMgImJhY2sgcHJlc3N1
cmUiIG9uIHRoZSBiYWxsb29uCj4gdHJ5aW5nIHRvIGluZmxhdGUuIEluIHRlc3RpbmcgSSd2ZSBz
ZWVuIHBlcmlvZHMgb2YgPiA0NSBzZWNvbmRzIHdoZXJlCj4gYmFsbG9vbiBpbmZsYXRpb24gbWFr
ZXMgbm8gbmV0IGZvcndhcmQgcHJvZ3Jlc3MuCj4gCj4gVGhpcyB3YXNuJ3QgYSBwcm9ibGVtIGJl
Zm9yZSB0aGUgY2hhbmdlIHRvIHRoZSBzaHJpbmtlciBBUEkgc2luY2UgZm9yY2VkCj4gYmFsbG9v
biBkZWZsYXRpb24gb25seSBvY2N1cnJlZCB2aWEgdGhlIE9PTSBub3RpZmllciBjYWxsYmFjayB3
aGljaCB3YXMKPiBpbnZva2VkIG9ubHkgYWZ0ZXIgdGhlIHBhZ2UgY2FjaGUgaGFkIGRlcGxldGVk
Lgo+IAo+IElzIHRoaXMgbmV3IGJ1c3kgYmVoYXZpb3Igd29ya2luZyBhcyBpbnRlbmRlZD8KClBs
ZWFzZSBub3RlIHRoYXQgdGhlIHNocmlua2VyIHdpbGwgb25seSBiZSByZWdpc3RlcmVkIGluIGNh
c2Ugd2UgaGF2ZQpWSVJUSU9fQkFMTE9PTl9GX0RFRkxBVEVfT05fT09NIC0gKHdoaWNoIGlzIEFG
QUlLIHZlcnkgcmFyZSkgLSB0bwppbXBsZW1lbnQgYXV0b21hdGljIGJhbGxvb24gZGVmbGF0aW9u
IHdoZW4gdGhlIGd1ZXN0IGlzIHVuZGVyIG1lbW9yeQpwcmVzc3VyZS4KCkFyZSB5b3UgYWN0dWFs
bHkgZXhwZXJpZW5jaW5nIGlzc3VlcyB3aXRoIHRoYXQgb3IgZGlkIHlvdSBqdXN0IHN0dW1ibGUK
b3ZlciB0aGUgY29kZT8KCi0tIApUaGFua3MsCgpEYXZpZCAvIGRoaWxkZW5iCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWls
aW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRp
b24=
