Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 267177AF7C7
	for <lists.virtualization@lfdr.de>; Wed, 27 Sep 2023 03:50:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4074641EB7;
	Wed, 27 Sep 2023 01:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4074641EB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kIz2W_Q2eeVS; Wed, 27 Sep 2023 01:50:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 50E1041EB5;
	Wed, 27 Sep 2023 01:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50E1041EB5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 799F6C008C;
	Wed, 27 Sep 2023 01:50:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0DBDBC0032
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Sep 2023 01:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5B2B41EB5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Sep 2023 01:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5B2B41EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SnndR31enN3S
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Sep 2023 01:50:05 +0000 (UTC)
Received: from out30-112.freemail.mail.aliyun.com
 (out30-112.freemail.mail.aliyun.com [115.124.30.112])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0338641E62
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Sep 2023 01:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0338641E62
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VsyF-Ei_1695779398; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VsyF-Ei_1695779398) by smtp.aliyun-inc.com;
 Wed, 27 Sep 2023 09:49:58 +0800
Message-ID: <1695779259.7440922-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [GIT PULL] virtio: features
Date: Wed, 27 Sep 2023 09:47:39 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Michael Roth <michael.roth@amd.com>
References: <20230903181338-mutt-send-email-mst@kernel.org>
 <20230926130451.axgodaa6tvwqs3ut@amd.com>
In-Reply-To: <20230926130451.axgodaa6tvwqs3ut@amd.com>
Cc: xuanzhuo@linux.alibaba.com, kvm@vger.kernel.org,
 Thomas Lendacky <thomas.lendacky@amd.com>, netdev@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, yuehaibing@huawei.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 yuanyaogoog@chromium.org, eperezma@redhat.com,
 Linus Torvalds <torvalds@linux-foundation.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVHVlLCAyNiBTZXAgMjAyMyAwODowNDo1MSAtMDUwMCwgTWljaGFlbCBSb3RoIDxtaWNoYWVs
LnJvdGhAYW1kLmNvbT4gd3JvdGU6Cj4gT24gU3VuLCBTZXAgMDMsIDIwMjMgYXQgMDY6MTM6MzhQ
TSAtMDQwMCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+ID4gVGhlIGZvbGxvd2luZyBjaGFu
Z2VzIHNpbmNlIGNvbW1pdCAyZGRlMThjZDFkOGZhYzczNTg3NWYyZTQ5ODdmMTE4MTdjYzBiYzJj
Ogo+ID4KPiA+ICAgTGludXggNi41ICgyMDIzLTA4LTI3IDE0OjQ5OjUxIC0wNzAwKQo+ID4KPiA+
IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+ID4KPiA+ICAgaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXN0L3Zob3N0LmdpdCB0
YWdzL2Zvcl9saW51cwo+ID4KPiA+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAxYWNm
ZTJjMTIyNTg5OWVhYjVhYjcyNGM5MWI3ZTFlYjI4ODFiOWFiOgo+ID4KPiA+ICAgdmlydGlvX3Jp
bmc6IGZpeCBhdmFpbF93cmFwX2NvdW50ZXIgaW4gdmlydHF1ZXVlX2FkZF9wYWNrZWQgKDIwMjMt
MDktMDMgMTg6MTA6MjQgLTA0MDApCj4gPgo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gdmlydGlvOiBmZWF0dXJl
cwo+ID4KPiA+IGEgc21hbGwgcHVsbCByZXF1ZXN0IHRoaXMgdGltZSBhcm91bmQsIG1vc3RseSBi
ZWNhdXNlIHRoZQo+ID4gdmR1c2UgbmV0d29yayBnb3QgcG9zdHBvbmVkIHRvIG5leHQgcmVsYXNl
IHNvIHdlIGNhbiBiZSBzdXJlCj4gPiB3ZSBnb3QgdGhlIHNlY3VyaXR5IHN0b3JlIHJpZ2h0Lgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+
Cj4gPgo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ID4gRXVnZW5pbyBQ6ZaeZXogKDQpOgo+ID4gICAgICAgdmRwYTog
YWRkIFZIT1NUX0JBQ0tFTkRfRl9FTkFCTEVfQUZURVJfRFJJVkVSX09LIGZsYWcKPiA+ICAgICAg
IHZkcGE6IGFjY2VwdCBWSE9TVF9CQUNLRU5EX0ZfRU5BQkxFX0FGVEVSX0RSSVZFUl9PSyBiYWNr
ZW5kIGZlYXR1cmUKPiA+ICAgICAgIHZkcGE6IGFkZCBnZXRfYmFja2VuZF9mZWF0dXJlcyB2ZHBh
IG9wZXJhdGlvbgo+ID4gICAgICAgdmRwYV9zaW06IG9mZmVyIFZIT1NUX0JBQ0tFTkRfRl9FTkFC
TEVfQUZURVJfRFJJVkVSX09LCj4gPgo+ID4gSmFzb24gV2FuZyAoMSk6Cj4gPiAgICAgICB2aXJ0
aW9fdmRwYTogYnVpbGQgYWZmaW5pdHkgbWFza3MgY29uZGl0aW9uYWxseQo+ID4KPiA+IFh1YW4g
Wmh1byAoMTIpOgo+ID4gICAgICAgdmlydGlvX3Jpbmc6IGNoZWNrIHVzZV9kbWFfYXBpIGJlZm9y
ZSB1bm1hcCBkZXNjIGZvciBpbmRpcmVjdAo+ID4gICAgICAgdmlydGlvX3Jpbmc6IHB1dCBtYXBw
aW5nIGVycm9yIGNoZWNrIGluIHZyaW5nX21hcF9vbmVfc2cKPiA+ICAgICAgIHZpcnRpb19yaW5n
OiBpbnRyb2R1Y2UgdmlydHF1ZXVlX3NldF9kbWFfcHJlbWFwcGVkKCkKPiA+ICAgICAgIHZpcnRp
b19yaW5nOiBzdXBwb3J0IGFkZCBwcmVtYXBwZWQgYnVmCj4gPiAgICAgICB2aXJ0aW9fcmluZzog
aW50cm9kdWNlIHZpcnRxdWV1ZV9kbWFfZGV2KCkKPiA+ICAgICAgIHZpcnRpb19yaW5nOiBza2lw
IHVubWFwIGZvciBwcmVtYXBwZWQKPiA+ICAgICAgIHZpcnRpb19yaW5nOiBjb3JyZWN0IHRoZSBl
eHByZXNzaW9uIG9mIHRoZSBkZXNjcmlwdGlvbiBvZiB2aXJ0cXVldWVfcmVzaXplKCkKPiA+ICAg
ICAgIHZpcnRpb19yaW5nOiBzZXBhcmF0ZSB0aGUgbG9naWMgb2YgcmVzZXQvZW5hYmxlIGZyb20g
dmlydHF1ZXVlX3Jlc2l6ZQo+ID4gICAgICAgdmlydGlvX3Jpbmc6IGludHJvZHVjZSB2aXJ0cXVl
dWVfcmVzZXQoKQo+ID4gICAgICAgdmlydGlvX3Jpbmc6IGludHJvZHVjZSBkbWEgbWFwIGFwaSBm
b3IgdmlydHF1ZXVlCj4gPiAgICAgICB2aXJ0aW9fcmluZzogaW50cm9kdWNlIGRtYSBzeW5jIGFw
aSBmb3IgdmlydHF1ZXVlCj4gPiAgICAgICB2aXJ0aW9fbmV0OiBtZXJnZSBkbWEgb3BlcmF0aW9u
cyB3aGVuIGZpbGxpbmcgbWVyZ2VhYmxlIGJ1ZmZlcnMKPgo+IFRoaXMgXiBwYXRjaCAodXBzdHJl
YW0gY29tbWl0IDI5NTUyNWUyOWEpIHNlZW1zIHRvIGNhdXNlIGEKPiBuZXR3b3JrLXJlbGF0ZWQg
cmVncmVzc2lvbiB3aGVuIHVzaW5nIFNXSU9UTEIgaW4gdGhlIGd1ZXN0LiBJIG5vdGljZWQKPiB0
aGlzIGluaXRpYWxseSB0ZXN0aW5nIFNFViBndWVzdHMsIHdoaWNoIHVzZSBTV0lPVExCIGJ5IGRl
ZmF1bHQsIGJ1dAo+IGl0IGNhbiBhbHNvIGJlIHNlZW4gd2l0aCBub3JtYWwgZ3Vlc3RzIHdoZW4g
Zm9yY2luZyBTV0lPVExCIHZpYQo+IHN3aW90bGI9Zm9yY2Uga2VybmVsIGNtZGxpbmUgb3B0aW9u
LiBJIHNlZSBpdCB3aXRoIGJvdGggNi42LXJjMSBhbmQKPiA2LjYtcmMyIChoYXZlbid0IHRyaWVk
IHJjMyB5ZXQsIGJ1dCBkb24ndCBzZWUgYW55IHJlbGF0ZWQgY2hhbmdlcwo+IHRoZXJlKSwgYW5k
IHJldmVydGluZyA3MTQwNzM0OTVmIHNlZW1zIHRvIGF2b2lkIHRoZSBpc3N1ZS4KPgo+IFN0ZXBz
IHRvIHJlcHJvZHVjZToKPgo+IDEpIEJvb3QgUUVNVS9LVk0gZ3Vlc3Qgd2l0aCA2LjYtcmMyIHdp
dGggc3dpb3RsYj1mb3JjZSB2aWEgc29tZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2luZyBjbWRsaW5l
Ogo+Cj4gICAgcWVtdS1zeXN0ZW0teDg2XzY0IFwKPiAgICAtbWFjaGluZSBxMzUgLXNtcCA0LG1h
eGNwdXM9MjU1IC1jcHUgRVBZQy1NaWxhbi12MiBcCj4gICAgLWVuYWJsZS1rdm0gLW0gMTZHLHNs
b3RzPTUsbWF4bWVtPTI1NkcgLXZnYSBub25lIFwKPiAgICAtZGV2aWNlIHZpcnRpby1zY3NpLXBj
aSxpZD1zY3NpMCxkaXNhYmxlLWxlZ2FjeT1vbixpb21tdV9wbGF0Zm9ybT10cnVlIFwKPiAgICAt
ZHJpdmUgZmlsZT0vaG9tZS9tcm90aC9zdG9yYWdlL3VidW50dS0xOC4wNC1zZXZlczIucWNvdzIs
aWY9bm9uZSxpZD1kcml2ZTAsc25hcHNob3Q9b2ZmIFwKPiAgICAtZGV2aWNlIHNjc2ktaGQsaWQ9
aGQwLGRyaXZlPWRyaXZlMCxidXM9c2NzaTAuMCBcCj4gICAgLWRldmljZSB2aXJ0aW8tbmV0LXBj
aSxuZXRkZXY9bmV0ZGV2MCxpZD1uZXQwLGRpc2FibGUtbGVnYWN5PW9uLGlvbW11X3BsYXRmb3Jt
PXRydWUscm9tZmlsZT0gXAo+ICAgIC1uZXRkZXYgdGFwLHNjcmlwdD0vaG9tZS9tcm90aC9xZW11
LWlmdXAsaWQ9bmV0ZGV2MCBcCj4gICAgLUwgL2hvbWUvbXJvdGgvc3RvcmFnZS9BTURTRVYyL3Nu
cC1yZWxlYXNlLTIwMjMtMDktMjMvdXNyL2xvY2FsL3NoYXJlL3FlbXUgXAo+ICAgIC1kcml2ZSBp
Zj1wZmxhc2gsZm9ybWF0PXJhdyx1bml0PTAsZmlsZT0vaG9tZS9tcm90aC9zdG9yYWdlL0FNRFNF
VjIvc25wLXJlbGVhc2UtMjAyMy0wOS0yMy91c3IvbG9jYWwvc2hhcmUvcWVtdS9PVk1GX0NPREUu
ZmQscmVhZG9ubHkgXAo+ICAgIC1kcml2ZSBpZj1wZmxhc2gsZm9ybWF0PXJhdyx1bml0PTEsZmls
ZT0vaG9tZS9tcm90aC9zdG9yYWdlL0FNRFNFVjIvc25wLXJlbGVhc2UtMjAyMy0wOS0yMy91c3Iv
bG9jYWwvc2hhcmUvcWVtdS9PVk1GX1ZBUlMuZmQgXAo+ICAgIC1kZWJ1Z2NvbiBmaWxlOmRlYnVn
LmxvZyAtZ2xvYmFsIGlzYS1kZWJ1Z2Nvbi5pb2Jhc2U9MHg0MDIgLW1zZyB0aW1lc3RhbXA9b24g
XAo+ICAgIC1rZXJuZWwgL2Jvb3Qvdm1saW51ei02LjYuMC1yYzItdmFuaWxsYTArIFwKPiAgICAt
aW5pdHJkIC9ib290L2luaXRyZC5pbWctNi42LjAtcmMyLXZhbmlsbGEwKyBcCj4gICAgLWFwcGVu
ZCAicm9vdD1VVUlEPWQ3MmE2ZDFjLTA2Y2YtNGI3OS1hZjQzLWYxYmFjNGY2MjBmOSBybyBjb25z
b2xlPXR0eVMwLDExNTIwMG44IGVhcmx5cHJpbnRrPXNlcmlhbCx0dHlTMCwxMTUyMDAgZGVidWc9
MSBzZXY9ZGVidWcgcGFnZV9wb2lzb249MCBzcGVjX3JzdGFja19vdmVyZmxvdz1vZmYgc3dpb3Rs
Yj1mb3JjZSIKPgo+IDIpIHNjcCBhIHNtYWxsIGZpbGUgZnJvbSB0aGUgaG9zdCB0byB0aGUgZ3Vl
c3QgSVAgdmlhIGl0cyB2aXJ0aW8tbmV0IGRldmljZS4KPiAgICBTbWFsbGVyIGZpbGUgc2l6ZXMg
c3VjY2VlZCwgYnV0IHRoZSBsYXJnZXIgdGhlIGZpbGUgdGhlIG1vcmUgbGlrZWx5Cj4gICAgaXQg
d2lsbCBmYWlsLiBlLmcuOgo+Cj4gICAgbXJvdGhAaG9zdDp+JCBkZCBpZj0vZGV2L3plcm8gb2Y9
dGVzdCBicz0xSyBjb3VudD0xOQo+ICAgIDE5KzAgcmVjb3JkcyBpbgo+ICAgIDE5KzAgcmVjb3Jk
cyBvdXQKPiAgICAxOTQ1NiBieXRlcyAoMTkga0IsIDE5IEtpQikgY29waWVkLCAwLjAwMDk0MDEz
NCBzLCAyMC43IE1CL3MKPiAgICBtcm90aEBob3N0On4kIHNjcCB0ZXN0IHZtMDoKPiAgICB0ZXN0
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAxMDAlICAgMTlLQiAgMTAuMU1CL3MgICAwMDowMAo+ICAgIG1yb3RoQGhvc3Q6
fiQgZGQgaWY9L2Rldi96ZXJvIG9mPXRlc3QgYnM9MUsgY291bnQ9MjAKPiAgICAyMCswIHJlY29y
ZHMgaW4KPiAgICAyMCswIHJlY29yZHMgb3V0Cj4gICAgMjA0ODAgYnl0ZXMgKDIwIGtCLCAyMCBL
aUIpIGNvcGllZCwgMC4wMDA5Mzc3NCBzLCAyMS44IE1CL3MKPiAgICBtcm90aEBob3N0On4kIHNj
cCB0ZXN0IHZtMDoKPiAgICB0ZXN0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAlICAgIDAgICAgIDAuMEtCL3MgICAt
LTotLSBFVEEKPiAgICBjbGllbnRfbG9vcDogc2VuZCBkaXNjb25uZWN0OiBCcm9rZW4gcGlwZQo+
ICAgIGxvc3QgY29ubmVjdGlvbgo+ICAgIG1yb3RoQGhvc3Q6fiQKCgpIaSBNaWNoYWVsLAoKVGhh
bmtzIGZvciB0aGUgcmVwb3J0LgoKQ2xvdWQgeW91IHRyeSB0aGlzIGZpeD8gIEkgcmVwcm9kdWNl
IHRoaXMgaXNzdWUsIGFuZCB0aGF0IHdvcmtzIGZvciBtZS4KClRoYW5rcy4KCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCmlu
ZGV4IDk4ZGM5YjQ5ZDU2Yi4uOWVjZTI3ZGM1MTQ0IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC92
aXJ0aW9fbmV0LmMKKysrIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCkBAIC01ODksMTYgKzU4
OSwxNiBAQCBzdGF0aWMgdm9pZCB2aXJ0bmV0X3JxX3VubWFwKHN0cnVjdCByZWNlaXZlX3F1ZXVl
ICpycSwgdm9pZCAqYnVmLCB1MzIgbGVuKQoKICAgICAgICAtLWRtYS0+cmVmOwoKLSAgICAgICBp
ZiAoZG1hLT5yZWYpIHsKLSAgICAgICAgICAgICAgIGlmIChkbWEtPm5lZWRfc3luYyAmJiBsZW4p
IHsKLSAgICAgICAgICAgICAgICAgICAgICAgb2Zmc2V0ID0gYnVmIC0gKGhlYWQgKyBzaXplb2Yo
KmRtYSkpOworICAgICAgIGlmIChkbWEtPm5lZWRfc3luYyAmJiBsZW4pIHsKKyAgICAgICAgICAg
ICAgIG9mZnNldCA9IGJ1ZiAtIChoZWFkICsgc2l6ZW9mKCpkbWEpKTsKCi0gICAgICAgICAgICAg
ICAgICAgICAgIHZpcnRxdWV1ZV9kbWFfc3luY19zaW5nbGVfcmFuZ2VfZm9yX2NwdShycS0+dnEs
IGRtYS0+YWRkciwgb2Zmc2V0LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbGVuLCBETUFfRlJPTV9ERVZJQ0UpOwotICAgICAg
ICAgICAgICAgfQorICAgICAgICAgICAgICAgdmlydHF1ZXVlX2RtYV9zeW5jX3NpbmdsZV9yYW5n
ZV9mb3JfY3B1KHJxLT52cSwgZG1hLT5hZGRyLAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9mZnNldCwgbGVuLAorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERNQV9GUk9NX0RFVklDRSk7
CisgICAgICAgfQoKKyAgICAgICBpZiAoZG1hLT5yZWYpCiAgICAgICAgICAgICAgICByZXR1cm47
Ci0gICAgICAgfQoKICAgICAgICB2aXJ0cXVldWVfZG1hX3VubWFwX3NpbmdsZV9hdHRycyhycS0+
dnEsIGRtYS0+YWRkciwgZG1hLT5sZW4sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgRE1BX0ZST01fREVWSUNFLCBETUFfQVRUUl9TS0lQX0NQVV9TWU5DKTsKCgo+Cj4g
VGhhbmtzLAo+Cj4gTWlrZQo+Cj4gPgo+ID4gWXVhbiBZYW8gKDEpOgo+ID4gICAgICAgdmlydGlv
X3Jpbmc6IGZpeCBhdmFpbF93cmFwX2NvdW50ZXIgaW4gdmlydHF1ZXVlX2FkZF9wYWNrZWQKPiA+
Cj4gPiBZdWUgSGFpYmluZyAoMSk6Cj4gPiAgICAgICB2ZHBhL21seDU6IFJlbW92ZSB1bnVzZWQg
ZnVuY3Rpb24gZGVjbGFyYXRpb25zCj4gPgo+ID4gIGRyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYyAg
ICAgICAgICAgfCAyMzAgKysrKysrKysrKysrKysrKysrLS0tCj4gPiAgZHJpdmVycy92ZHBhL21s
eDUvY29yZS9tbHg1X3ZkcGEuaCB8ICAgMyAtCj4gPiAgZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3Zk
cGFfc2ltLmMgICB8ICAgOCArCj4gPiAgZHJpdmVycy92aG9zdC92ZHBhLmMgICAgICAgICAgICAg
ICB8ICAxNSArLQo+ID4gIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMgICAgICAgfCA0MTIg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQo+ID4gIGRyaXZlcnMvdmlydGlv
L3ZpcnRpb192ZHBhLmMgICAgICAgfCAgMTcgKy0KPiA+ICBpbmNsdWRlL2xpbnV4L3ZkcGEuaCAg
ICAgICAgICAgICAgIHwgICA0ICsKPiA+ICBpbmNsdWRlL2xpbnV4L3ZpcnRpby5oICAgICAgICAg
ICAgIHwgIDIyICsrCj4gPiAgaW5jbHVkZS91YXBpL2xpbnV4L3Zob3N0X3R5cGVzLmggICB8ICAg
NCArCj4gPiAgOSBmaWxlcyBjaGFuZ2VkLCA2MjUgaW5zZXJ0aW9ucygrKSwgOTAgZGVsZXRpb25z
KC0pCj4gPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpW
aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vdmlydHVhbGl6YXRpb24=
