Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id D25E83AACA2
	for <lists.virtualization@lfdr.de>; Thu, 17 Jun 2021 08:42:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 525936077F;
	Thu, 17 Jun 2021 06:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CB5B01Nd_mWY; Thu, 17 Jun 2021 06:42:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1EA386077A;
	Thu, 17 Jun 2021 06:42:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2E77C000B;
	Thu, 17 Jun 2021 06:41:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 327BBC000B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Jun 2021 06:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 171AA41603
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Jun 2021 06:41:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AiZMnEqKQN3e
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Jun 2021 06:41:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2E6441601
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Jun 2021 06:41:56 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=22; SR=0; TI=SMTPD_---0UchRl1W_1623912110; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0UchRl1W_1623912110) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 17 Jun 2021 14:41:51 +0800
MIME-Version: 1.0
Message-Id: <1623911825.4660118-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH net-next v5 13/15] virtio-net: support AF_XDP zc rx
Date: Thu, 17 Jun 2021 14:37:05 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
In-Reply-To: <0d4c5ff5-2b53-6b55-b5aa-bd943af98bb7@redhat.com>
X-Mailing-List: bpf@vger.kernel.org
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrew Melnychenko <andrew@daynix.com>,
 Andrii Nakryiko <andrii@kernel.org>, netdev@vger.kernel.org,
 yuri Benditovich <yuri.benditovich@daynix.com>,
 =?utf-8?b?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 "dust.li" <dust.li@linux.alibaba.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Magnus Karlsson <magnus.karlsson@intel.com>
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

T24gVGh1LCAxNyBKdW4gMjAyMSAxNDowMzoyOSArMDgwMCwgSmFzb24gV2FuZyA8amFzb3dhbmdA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiDlnKggMjAyMS82LzE3IOS4i+WNiDE6NTMsIFh1YW4gWmh1
byDlhpnpgZM6Cj4gPiBPbiBUaHUsIDE3IEp1biAyMDIxIDExOjIzOjUyICswODAwLCBKYXNvbiBX
YW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90ZToKPiA+PiDlnKggMjAyMS82LzEwIOS4i+WN
iDQ6MjIsIFh1YW4gWmh1byDlhpnpgZM6Cj4gPj4+IENvbXBhcmVkIHRvIHRoZSBjYXNlIG9mIHhz
ayB0eCwgdGhlIGNhc2Ugb2YgeHNrIHpjIHJ4IGlzIG1vcmUKPiA+Pj4gY29tcGxpY2F0ZWQuCj4g
Pj4+Cj4gPj4+IFdoZW4gd2UgcHJvY2VzcyB0aGUgYnVmIHJlY2VpdmVkIGJ5IHZxLCB3ZSBtYXkg
ZW5jb3VudGVyIG9yZGluYXJ5Cj4gPj4+IGJ1ZmZlcnMsIG9yIHhzayBidWZmZXJzLiBXaGF0IG1h
a2VzIHRoZSBzaXR1YXRpb24gbW9yZSBjb21wbGljYXRlZCBpcwo+ID4+PiB0aGF0IGluIHRoZSBj
YXNlIG9mIG1lcmdlYWJsZSwgd2hlbiBudW1fYnVmZmVyID4gMSwgd2UgbWF5IHN0aWxsCj4gPj4+
IGVuY291bnRlciB0aGUgY2FzZSB3aGVyZSB4c2sgYnVmZmVyIGlzIG1peGVkIHdpdGggb3JkaW5h
cnkgYnVmZmVyLgo+ID4+Pgo+ID4+PiBBbm90aGVyIHRoaW5nIHRoYXQgbWFrZXMgdGhlIHNpdHVh
dGlvbiBtb3JlIGNvbXBsaWNhdGVkIGlzIHRoYXQgd2hlbiB3ZQo+ID4+PiBnZXQgYW4geHNrIGJ1
ZmZlciBmcm9tIHZxLCB0aGUgeHNrIGJvdW5kIHRvIHRoaXMgeHNrIGJ1ZmZlciBtYXkgaGF2ZQo+
ID4+PiBiZWVuIHVuYm91bmQuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IFh1YW4gWmh1byA8
eHVhbnpodW9AbGludXguYWxpYmFiYS5jb20+Cj4gPj4KPiA+PiBUaGlzIGlzIHNvbWVob3cgc2lt
aWxhciB0byB0aGUgY2FzZSBvZiB0eCB3aGVyZSB3ZSBkb24ndCBoYXZlIHBlciB2cSByZXNldC4K
PiA+Pgo+ID4+IFsuLi5dCj4gPj4KPiA+Pj4gLQlpZiAodmktPm1lcmdlYWJsZV9yeF9idWZzKQo+
ID4+PiArCWlmIChpc194c2tfY3R4KGN0eCkpCj4gPj4+ICsJCXNrYiA9IHJlY2VpdmVfeHNrKGRl
diwgdmksIHJxLCBidWYsIGxlbiwgeGRwX3htaXQsIHN0YXRzKTsKPiA+Pj4gKwllbHNlIGlmICh2
aS0+bWVyZ2VhYmxlX3J4X2J1ZnMpCj4gPj4+ICAgIAkJc2tiID0gcmVjZWl2ZV9tZXJnZWFibGUo
ZGV2LCB2aSwgcnEsIGJ1ZiwgY3R4LCBsZW4sIHhkcF94bWl0LAo+ID4+PiAgICAJCQkJCXN0YXRz
KTsKPiA+Pj4gICAgCWVsc2UgaWYgKHZpLT5iaWdfcGFja2V0cykKPiA+Pj4gQEAgLTExNzUsNiAr
MTI5NiwxNCBAQCBzdGF0aWMgYm9vbCB0cnlfZmlsbF9yZWN2KHN0cnVjdCB2aXJ0bmV0X2luZm8g
KnZpLCBzdHJ1Y3QgcmVjZWl2ZV9xdWV1ZSAqcnEsCj4gPj4+ICAgIAlpbnQgZXJyOwo+ID4+PiAg
ICAJYm9vbCBvb207Cj4gPj4+Cj4gPj4+ICsJLyogQmVjYXVzZSB2aXJ0aW8tbmV0IGRvZXMgbm90
IHlldCBzdXBwb3J0IGZsb3cgZGlyZWN0LAo+ID4+Cj4gPj4gTm90ZSB0aGF0IHRoaXMgaXMgbm90
IHRoZSBjYXNlIGFueSBtb3JlLiBSU1MgaGFzIGJlZW4gc3VwcG9ydGVkIGJ5Cj4gPj4gdmlydGlv
IHNwZWMgYW5kIHFlbXUvdmhvc3QvdGFwIG5vdy4gV2UganVzdCBuZWVkIHNvbWUgd29yayBvbiB0
aGUKPiA+PiB2aXJ0aW8tbmV0IGRyaXZlciBwYXJ0IChlLmcgdGhlIGV0aG9vbCBpbnRlcmZhY2Up
Lgo+ID4gT2gsIGFyZSB0aGVyZSBhbnkgcGxhbnM/IFdobyBpcyBkb2luZyB0aGlzIHdvcmssIGNh
biBJIGhlbHA/Cj4KPgo+IFFlbXUgYW5kIHNwZWMgaGFzIHN1cHBvcnQgUlNTLgo+Cj4gVEFQIHN1
cHBvcnQgaXMgcmVhZHkgdmlhIHN0ZWVyaW5nIGVCUEYgcHJvZ3JhbSwgeW91IGNhbiB0cnkgdG8g
cGxheSBpdAo+IHdpdGggY3VycmVudCBxZW11IG1hc3Rlci4KPgo+IFRoZSBvbmx5IHRoaW5nIG1p
c3NlZCBpcyB0aGUgTGludXggZHJpdmVyLCBJIHRoaW5rIFl1cmkgb3IgQW5kcmV3IGlzCj4gd29y
a2luZyBvbiB0aGlzLgoKSSBmZWVsIHRoYXQgaW4gdGhlIGNhc2Ugb2YgeHNrLCB0aGUgZmxvdyBk
aXJlY3RvciBpcyBtb3JlIGFwcHJvcHJpYXRlLgoKVXNlcnMgbWF5IHN0aWxsIHdhbnQgdG8gYWxs
b2NhdGUgcGFja2V0cyB0byBhIGNlcnRhaW4gY2hhbm5lbCBiYXNlZCBvbgppbmZvcm1hdGlvbiBz
dWNoIGFzIHBvcnQvaXAvdGNwL3VkcCwgYW5kIHRoZW4geHNrIHdpbGwgcHJvY2VzcyB0aGVtLgoK
SSB3aWxsIHRyeSB0byBwdXNoIHRoZSBmbG93IGRpcmVjdG9yIHRvIHRoZSBzcGVjLgoKVGhhbmtz
LgoKPgo+IFRoYW5rcwo+Cj4KPiA+Cj4gPiBUaGFua3MuCj4gPgo+ID4+IFRoYW5rcwo+ID4+Cj4g
Pj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
