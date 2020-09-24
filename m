Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD2C276AB0
	for <lists.virtualization@lfdr.de>; Thu, 24 Sep 2020 09:23:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 71818874D4;
	Thu, 24 Sep 2020 07:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SJw8GY3jiwt9; Thu, 24 Sep 2020 07:23:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 84213874CF;
	Thu, 24 Sep 2020 07:23:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6711FC0051;
	Thu, 24 Sep 2020 07:23:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1CB03C0051
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 07:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 18CAA86B2C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 07:23:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1A1nA51MwhlA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 07:23:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 203CA8555A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 07:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600932181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n9ho7ZxUFjV5yAYuN8t5tarm5DyMHoZty06HftqxrjU=;
 b=ZHxMuhxWIewaCNhWDU6gr+9OGZRkSD2HtvdHFW5XJON6ceWBwj2feGHmO46t5nGyxTUgXv
 KBjUF0GZzatTy70r1re/YKhaXlY0WzcfePcvv2ejf20kWeVisiSwJagN7iwbwn003gMjh/
 U9FMA364c6tmvV8jpah36uotBnvWtkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-O94fTBLHNcOBCXemmv_D7Q-1; Thu, 24 Sep 2020 03:22:59 -0400
X-MC-Unique: O94fTBLHNcOBCXemmv_D7Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A38578015A5;
 Thu, 24 Sep 2020 07:22:58 +0000 (UTC)
Received: from [10.72.13.193] (ovpn-13-193.pek2.redhat.com [10.72.13.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CA421002C01;
 Thu, 24 Sep 2020 07:22:49 +0000 (UTC)
Subject: Re: [PATCH 2/8] vhost: add helper to check if a vq has been setup
To: Mike Christie <michael.christie@oracle.com>, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, mst@redhat.com,
 pbonzini@redhat.com, stefanha@redhat.com,
 virtualization@lists.linux-foundation.org
References: <1600712588-9514-1-git-send-email-michael.christie@oracle.com>
 <1600712588-9514-3-git-send-email-michael.christie@oracle.com>
 <e2d16333-d5ed-4c5c-58b3-7b5d0a9da47a@redhat.com>
 <63094bae-1f26-c21e-9b3c-3a6aa99a7e24@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e81db364-8b9e-bd01-5d22-3fd52375c8d3@redhat.com>
Date: Thu, 24 Sep 2020 15:22:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <63094bae-1f26-c21e-9b3c-3a6aa99a7e24@oracle.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Ck9uIDIwMjAvOS8yNCDkuIrljYgzOjEyLCBNaWtlIENocmlzdGllIHdyb3RlOgo+IE9uIDkvMjEv
MjAgOTowMiBQTSwgSmFzb24gV2FuZyB3cm90ZToKPj4gT24gMjAyMC85LzIyIOS4iuWNiDI6MjMs
IE1pa2UgQ2hyaXN0aWUgd3JvdGU6Cj4+PiBUaGlzIGFkZHMgYSBoZWxwZXIgY2hlY2sgaWYgYSB2
cSBoYXMgYmVlbiBzZXR1cC4gVGhlIG5leHQgcGF0Y2hlcwo+Pj4gd2lsbCB1c2UgdGhpcyB3aGVu
IHdlIG1vdmUgdGhlIHZob3N0IHNjc2kgY21kIHByZWFsbG9jYXRpb24gZnJvbSBwZXIKPj4+IHNl
c3Npb24gdG8gcGVyIHZxLiBJbiB0aGUgcGVyIHZxIGNhc2UsIHdlIG9ubHkgd2FudCB0byBhbGxv
Y2F0ZSBjbWRzCj4+PiBmb3IgdnFzIHRoYXQgaGF2ZSBhY3R1YWxseSBiZWVuIHNldHVwIGFuZCBu
b3QgZm9yIGFsbCB0aGUgcG9zc2libGUKPj4+IHZxcy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBN
aWtlIENocmlzdGllIDxtaWNoYWVsLmNocmlzdGllQG9yYWNsZS5jb20+Cj4+PiAtLS0KPj4+ICDC
oCBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCA5ICsrKysrKysrKwo+Pj4gIMKgIGRyaXZlcnMvdmhv
c3Qvdmhvc3QuaCB8IDEgKwo+Pj4gIMKgIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmMgYi9kcml2ZXJzL3Zo
b3N0L3Zob3N0LmMKPj4+IGluZGV4IGI0NTUxOWMuLjVkZDllYjEgMTAwNjQ0Cj4+PiAtLS0gYS9k
cml2ZXJzL3Zob3N0L3Zob3N0LmMKPj4+ICsrKyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+Pj4g
QEAgLTMwNSw2ICszMDUsMTUgQEAgc3RhdGljIHZvaWQgdmhvc3RfdnJpbmdfY2FsbF9yZXNldChz
dHJ1Y3Qgdmhvc3RfdnJpbmdfY2FsbCAqY2FsbF9jdHgpCj4+PiAgwqDCoMKgwqDCoCBzcGluX2xv
Y2tfaW5pdCgmY2FsbF9jdHgtPmN0eF9sb2NrKTsKPj4+ICDCoCB9Cj4+PiAgwqAgK2Jvb2wgdmhv
c3RfdnFfaXNfc2V0dXAoc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEpCj4+PiArewo+Pj4gK8Kg
wqDCoCBpZiAodnEtPmF2YWlsICYmIHZxLT5kZXNjICYmIHZxLT51c2VkICYmIHZob3N0X3ZxX2Fj
Y2Vzc19vayh2cSkpCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7Cj4+PiArwqDCoMKg
IGVsc2UKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7Cj4+PiArfQo+Pj4gK0VYUE9S
VF9TWU1CT0xfR1BMKHZob3N0X3ZxX2lzX3NldHVwKTsKPj4KPj4gVGhpcyBpcyBwcm9iYWJseSBv
ayBidXQgSSB3b25kZXIgbWF5YmUgd2Ugc2hvdWxkIGhhdmUgc29tZXRoaW5nIGxpa2Ugd2hhdCB2
RFBBIGRpZCAoVkhPU1RfU0VUX1ZSSU5HX0VOQUJMRSkgdG8gbWF0Y2ggdmlydGlvIDEuMCBkZXZp
Y2UgZGVmaW5pdGlvbi4KPiBJdCBsb29rcyBsaWtlIEkgY2FuIG1ha2UgdGhhdCB3b3JrLiBTb21l
IHF1ZXN0aW9uczoKPgo+IDEuIERvIHlvdSBtZWFuIGEgZ2VuZXJpYyBWSE9TVF9TRVRfVlJJTkdf
RU5BQkxFIG9yIGEgU0NTSSBzcGVjaWZpYyBvbmUgVkhPU1RfU0NTSV9TRVRfVlJJTkdfRU5BQkxF
PwoKCkl0IHdvdWxkIGJlIGJldHRlciBpZiB3ZSBjYW4gbWFrZSBpdCBnZW5lcmljLgoKCj4KPiAy
LiBJIGNhbiBzZWUgdGhlIFZIT1NUX1ZEUEFfU0VUX1ZSSU5HX0VOQUJMRSBrZXJuZWwgY29kZSBh
bmQgdGhlIHZob3N0X3NldF92cmluZ19lbmFibGUgcWVtdSBjb2RlLCBzbyBJIGhhdmUgYW4gaWRl
YSBvZiBob3cgaXQgc2hvdWxkIHdvcmsgZm9yIHZob3N0IHNjc2kuIEhvd2V2ZXIsIEknbSBub3Qg
c3VyZSB0aGUgcmVxdWlyZW1lbnRzIGZvciBhIGdlbmVyaWMgVkhPU1RfU0VUX1ZSSU5HX0VOQUJM
RSBpZiB0aGF0IGlzIHdoYXQgeW91IG1lYW50LiBJIGNvdWxkIG5vdCBmaW5kIGl0IGluIHRoZSBz
cGVjIGVpdGhlci4gQ291bGQgeW91IHNlbmQgbWUgYSBwb2ludGVyIHRvIHRoZSBzZWN0aW9uPwoK
CkluIHRoZSBzcGVjLCBmb3IgUENJLCBpdCdzIHRoZSBxdWV1ZV9lbmFibGUgZm9yIG1vZGVybiBk
ZXZpY2UuCgoKPgo+IEZvciBleGFtcGxlLCBmb3Igdmhvc3QtbmV0IHdlIHNlZW0gdG8gZW5hYmxl
IGEgZGV2aWNlIGluIHRoZSBWSE9TVF9ORVRfU0VUX0JBQ0tFTkQgaW9jdGwsIHNvIEknbSBub3Qg
c3VyZSB3aGF0IGJlaGF2aW9yIHNob3VsZCBiZSBvciBuZWVkcyB0byBiZSBpbXBsZW1lbnRlZCBm
b3IgbmV0IGFuZCB2c29jay4KCgpZZXMsIGJ1dCBWSE9TVF9ORVRfU0VUX0JBQ0tFTkQgaXMgZm9y
IHRoZSB3aG9sZSBkZXZpY2Ugbm90IGEgc3BlY2lmaWMgCnZpcnRxdWV1ZS4KCgpUaGFua3MKCgo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
