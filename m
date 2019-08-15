Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAC08E301
	for <lists.virtualization@lfdr.de>; Thu, 15 Aug 2019 05:01:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 54158CBB;
	Thu, 15 Aug 2019 03:01:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D4CFEC8F
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 03:01:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6A05467F
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 03:01:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 65AB066C46;
	Thu, 15 Aug 2019 03:01:10 +0000 (UTC)
Received: from [10.72.12.184] (ovpn-12-184.pek2.redhat.com [10.72.12.184])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 997847B6FC;
	Thu, 15 Aug 2019 03:01:02 +0000 (UTC)
Subject: Re: [PATCH] virtio-net: lower min ring num_free for efficiency
To: ? jiang <jiangkidd@hotmail.com>, "mst@redhat.com" <mst@redhat.com>
References: <BYAPR14MB3205E4E194942B0A1A91A222A6AD0@BYAPR14MB3205.namprd14.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f61d9621-cc33-44a2-f297-43f8af8d759b@redhat.com>
Date: Thu, 15 Aug 2019 11:01:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <BYAPR14MB3205E4E194942B0A1A91A222A6AD0@BYAPR14MB3205.namprd14.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 15 Aug 2019 03:01:10 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
	"songliubraving@fb.com" <songliubraving@fb.com>,
	"jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
	"hawk@kernel.org" <hawk@kernel.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>,
	"jiangran.jr@alibaba-inc.com" <jiangran.jr@alibaba-inc.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>,
	"ast@kernel.org" <ast@kernel.org>, "kafai@fb.com" <kafai@fb.com>,
	"yhs@fb.com" <yhs@fb.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvOC8xNCDkuIrljYgxMDowNiwgPyBqaWFuZyB3cm90ZToKPiBUaGlzIGNoYW5nZSBs
b3dlcnMgcmluZyBidWZmZXIgcmVjbGFpbSB0aHJlc2hvbGQgZnJvbSAxLzIqcXVldWUgdG8gYnVk
Z2V0Cj4gZm9yIGJldHRlciBwZXJmb3JtYW5jZS4gQWNjb3JkaW5nIHRvIG91ciB0ZXN0IHdpdGgg
cWVtdSArIGRwZGssIHBhY2tldAo+IGRyb3BwaW5nIGhhcHBlbnMgd2hlbiB0aGUgZ3Vlc3QgaXMg
bm90IGFibGUgdG8gcHJvdmlkZSBmcmVlIGJ1ZmZlciBpbgo+IGF2YWlsIHJpbmcgdGltZWx5IHdp
dGggZGVmYXVsdCAxLzIqcXVldWUuIFRoZSB2YWx1ZSBpbiB0aGUgcGF0Y2ggaGFzIGJlZW4KPiB0
ZXN0ZWQgYW5kIGRvZXMgc2hvdyBiZXR0ZXIgcGVyZm9ybWFuY2UuCgoKUGxlYXNlIGFkZCB5b3Vy
IHRlc3RzIHNldHVwIGFuZCByZXN1bHQgaGVyZS4KClRoYW5rcwoKCj4KPiBTaWduZWQtb2ZmLWJ5
OiBqaWFuZ2tpZGQgPGppYW5na2lkZEBob3RtYWlsLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvbmV0
L3ZpcnRpb19uZXQuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYyBi
L2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYwo+IGluZGV4IDBkNDExNWM5ZTIwYi4uYmMwOGJlNzky
NWViIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYwo+ICsrKyBiL2RyaXZl
cnMvbmV0L3ZpcnRpb19uZXQuYwo+IEBAIC0xMzMxLDcgKzEzMzEsNyBAQCBzdGF0aWMgaW50IHZp
cnRuZXRfcmVjZWl2ZShzdHJ1Y3QgcmVjZWl2ZV9xdWV1ZSAqcnEsIGludCBidWRnZXQsCj4gICAJ
CX0KPiAgIAl9Cj4gICAKPiAtCWlmIChycS0+dnEtPm51bV9mcmVlID4gdmlydHF1ZXVlX2dldF92
cmluZ19zaXplKHJxLT52cSkgLyAyKSB7Cj4gKwlpZiAocnEtPnZxLT5udW1fZnJlZSA+IG1pbigo
dW5zaWduZWQgaW50KWJ1ZGdldCwgdmlydHF1ZXVlX2dldF92cmluZ19zaXplKHJxLT52cSkpIC8g
Mikgewo+ICAgCQlpZiAoIXRyeV9maWxsX3JlY3YodmksIHJxLCBHRlBfQVRPTUlDKSkKPiAgIAkJ
CXNjaGVkdWxlX2RlbGF5ZWRfd29yaygmdmktPnJlZmlsbCwgMCk7Cj4gICAJfQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWls
aW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRp
b24=
