Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 105BCD8ADD
	for <lists.virtualization@lfdr.de>; Wed, 16 Oct 2019 10:26:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 90CD4A70;
	Wed, 16 Oct 2019 08:26:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5EC829BA
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 08:26:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EA83613A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 08:26:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E3E081F07;
	Wed, 16 Oct 2019 08:26:41 +0000 (UTC)
Received: from [10.72.12.53] (ovpn-12-53.pek2.redhat.com [10.72.12.53])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C2FC5C1B5;
	Wed, 16 Oct 2019 08:26:15 +0000 (UTC)
Subject: Re: [RFC 0/2] Intel IFC VF driver for vdpa
To: Zhu Lingshan <lingshan.zhu@linux.intel.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
	alex.williamson@redhat.com
References: <20191016013050.3918-1-lingshan.zhu@intel.com>
	<37503c7d-c07d-e584-0b6f-3733d2ad1dc7@linux.intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <47befa11-c943-42f7-85c9-01b12f497182@redhat.com>
Date: Wed, 16 Oct 2019 16:26:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <37503c7d-c07d-e584-0b6f-3733d2ad1dc7@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 16 Oct 2019 08:26:41 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, zhiyuan.lv@intel.com,
	jason.zeng@intel.com
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

Ck9uIDIwMTkvMTAvMTYg5LiK5Y2IOTozNiwgWmh1IExpbmdzaGFuIHdyb3RlOgo+IGZhaWxlZCB0
byBzZW5kIHRvIGt2bSBsaXN0LCByZXNlbmQsIHNvcnJ5IGZvciB0aGUgaW5jb252ZW5pZW5jZS4K
Pgo+IFRIYW5rcywKPiBCUgo+IFpodSBMaW5nc2hhbgo+Cj4gT24gMTAvMTYvMjAxOSA5OjMwIEFN
LCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4+IEhpIGFsbDoKPj4gwqAgVGhpcyBzZXJpZXMgaW50ZW5k
cyB0byBpbnRyb2R1Y2UgSW50ZWwgSUZDIFZGIE5JQyBkcml2ZXIgZm9yIFZob3N0Cj4+IERhdGEg
UGxhbmUgQWNjZWxlcmF0aW9uLgo+PiDCoCBIZXJlIGNvbWVzIHR3byBtYWluIHBhcnRzLCBvbmUg
aXMgaWZjdmZfYmFzZSBsYXllciwgd2hpY2ggaGFuZGxlcwo+PiBoYXJkd2FyZSBvcGVyYXRpb25z
LiBUaGUgb3RoZXIgaXMgaWZjdmZfbWFpbiBsYXllciBoYW5kbGVzIFZGCj4+IGluaXRpYWxpemF0
aW9uLCBjb25maWd1cmF0aW9uIGFuZCByZW1vdmFsLCB3aGljaCBkZXBlbmRzIG9uCj4+IGFuZCBj
b21wbHlzIHRvIHZob3N0X21kZXYgaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvOS8yNi8xNQo+
PiDCoCBUaGlzIGlzIGEgZmlyc3QgUkZDIHRyeSwgcGxlYXNlIGhlbHAgcmV2aWV3LgoKCkl0IHdv
dWxkIGJlIGhlbHBmdWwgaWYgeW9uIGNhbiBkZXNjcmliZSB3aGljaCBraW5kcyBvZiB0ZXN0IHRo
YXQgaGFzIApiZWVuIGRvbmUgZm9yIHRoaXMgc2VyaWVzLgoKVGhhbmtzCgoKPj4gwqAgVGhhbmtz
IQo+PiBCUgo+PiBaaHUgTGluZ3NoYW4KPj4KPj4KPj4gWmh1IExpbmdzaGFuICgyKToKPj4gwqDC
oCB2aG9zdDogSUZDIFZGIGhhcmR3YXJlIG9wZXJhdGlvbiBsYXllcgo+PiDCoMKgIHZob3N0OiBJ
RkMgVkYgdmRwYSBsYXllcgo+Pgo+PiDCoCBkcml2ZXJzL3Zob3N0L2lmY3ZmL2lmY3ZmX2Jhc2Uu
YyB8IDM5MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+IMKgIGRyaXZlcnMvdmhvc3Qv
aWZjdmYvaWZjdmZfYmFzZS5oIHwgMTM3ICsrKysrKysrKysKPj4gwqAgZHJpdmVycy92aG9zdC9p
ZmN2Zi9pZmN2Zl9tYWluLmMgfCA1NDEgCj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDEwNjggaW5zZXJ0aW9ucygrKQo+PiDC
oCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aG9zdC9pZmN2Zi9pZmN2Zl9iYXNlLmMKPj4g
wqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmhvc3QvaWZjdmYvaWZjdmZfYmFzZS5oCj4+
IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3Zob3N0L2lmY3ZmL2lmY3ZmX21haW4uYwo+
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
