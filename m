Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A18F173567
	for <lists.virtualization@lfdr.de>; Fri, 28 Feb 2020 11:36:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D7E3B87F0C;
	Fri, 28 Feb 2020 10:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8LHT1nWzONPq; Fri, 28 Feb 2020 10:36:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 56A6187F52;
	Fri, 28 Feb 2020 10:36:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3AEAAC0177;
	Fri, 28 Feb 2020 10:36:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 520C3C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 10:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 398F686D2E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 10:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id efmWMOUjtcqq
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 10:36:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 26A0186CF1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 10:36:12 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 01SAa4L1026700
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Feb 2020 11:36:05 +0100
Received: from [139.22.118.65] ([139.22.118.65])
 by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01SAa3Mw010678;
 Fri, 28 Feb 2020 11:36:03 +0100
Subject: Re: VIRTIO adoption in other hypervisors
From: Jan Kiszka <jan.kiszka@siemens.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 virtio-dev@lists.oasis-open.org, virtualization@lists.linux-foundation.org
References: <87mu93vwy2.fsf@linaro.org>
 <db75fc2b-ac2e-2351-cc3c-cdb42a50ac24@siemens.com>
Message-ID: <0b80da21-ed40-c550-c605-031a209115b1@siemens.com>
Date: Fri, 28 Feb 2020 11:36:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <db75fc2b-ac2e-2351-cc3c-cdb42a50ac24@siemens.com>
Content-Language: en-US
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <liuw@liuw.name>
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

T24gMjguMDIuMjAgMTE6MzAsIEphbiBLaXN6a2Egd3JvdGU6Cj4gT24gMjguMDIuMjAgMTE6MTYs
IEFsZXggQmVubsOpZSB3cm90ZToKPj4gSGksCj4+Cj4+IEknbSBjdXJyZW50bHkgdHJ5aW5nIHRv
IGdldCBteSBoZWFkIGFyb3VuZCB2aXJ0aW8gYW5kIHdhcyB3b25kZXJpbmcgaG93Cj4+IHdpZGVz
cHJlYWQgYWRvcHRpb24gb2YgdmlydGlvIGlzIGFtb25nc3QgdGhlIHZhcmlvdXMgaHlwZXJ2aXNv
cnMgYW5kCj4+IGVtdWxhdG9ycyBvdXQgdGhlcmUuCj4+Cj4+IE9idmlvdXNseSBJJ20gZmFtaWxp
YXIgd2l0aCBRRU1VIGJvdGggdmlhIEtWTSBhbmQgZXZlbiB3aGVuIGp1c3QgZG9pbmcKPj4gcGxh
aW4gZW11bGF0aW9uIChhbHRob3VnaCB3aXRoIHNvbWUgcmVzdHJpY3Rpb25zKS4gQXMgZmFyIGFz
IEknbSBhd2FyZQo+PiB0aGUgdmFyaW91cyBSdXN0IGJhc2VkIFZNTXMgaGF2ZSB2YXJ5IGRlZ3Jl
ZXMgb2Ygc3VwcG9ydCBmb3IgdmlydGlvCj4+IGRldmljZXMgb3ZlciBLVk0gYXMgd2VsbC4gQ3Jv
c1ZNIHNwZWNpZmljYWxseSBpcyBlbWJyYWNpbmcgdmlydGlvIGZvcgo+PiBtdWx0aS1wcm9jZXNz
IGRldmljZSBlbXVsYXRpb24uCj4+Cj4+IEkgYmVsaWV2ZSB0aGVyZSBoYXMgYmVlbiBzb21lIGRl
dmVsb3BtZW50IHdvcmsgZm9yIHN1cHBvcnRpbmcgVklSVElPIG9uCj4+IFhlbiBhbHRob3VnaCBp
dCBzZWVtcyB0byBoYXZlIHN0YWxsZWQgYWNjb3JkaW5nIHRvOgo+Pgo+PiDCoMKgIGh0dHBzOi8v
d2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1ZpcnRpb19Pbl9YZW4KPj4KPj4gUmVjZW50bHkgYXQg
S1ZNIEZvcnVtIHRoZXJlIHdhcyBKYW4ncyB0YWxrIGFib3V0IEludGVyLVZNIHNoYXJlZCBtZW1v
cnkKPj4gd2hpY2ggcHJvcG9zZWQgaXZzaG1lbXYyIGFzIGEgVklSVElPIHRyYW5zcG9ydDoKPj4K
Pj4gICAgCj4+IGh0dHBzOi8vZXZlbnRzMTkubGludXhmb3VuZGF0aW9uLm9yZy9ldmVudHMva3Zt
LWZvcnVtLTIwMTkvcHJvZ3JhbS9zY2hlZHVsZS8gCj4+Cj4+Cj4+IEFzIEkgdW5kZXJzdG9vZCBp
dCB0aGlzIHdvdWxkIGFsbG93IFhlbiAoYW5kIG90aGVyIGh5cGVydmlzb3JzKSBhIHNpbXBsZQo+
PiB3YXkgdG8gYmUgYWJsZSB0byBjYXJyeSB2aXJ0aW8gdHJhZmZpYyBiZXR3ZWVuIGd1ZXN0IGFu
ZCBlbmQgcG9pbnQuCgpBbmQgdG8gY2xhcmlmeSB0aGUgc2NvcGUgb2YgdGhpcyBlZmZvcnQ6IHZp
cnRpby1vdmVyLWl2c2htZW0gaXMgbm90IHRoZSAKZmFzdGVzdCBvcHRpb24gdG8gb2ZmZXIgdmly
dGlvIHRvIGEgZ3Vlc3QgKHN0YXRpYyAiRE1BIiB3aW5kb3cpLCBidXQgaXQgCmlzIHRoZSBzaW1w
bGVzdCBvbmUgZnJvbSB0aGUgaHlwZXJ2aXNvciBQb1YgYW5kLCB0aHVzLCBhbHNvIGxpa2VseSB0
aGUgCmVhc2llc3Qgb25lIHRvIGFyZ3VlIG92ZXIgd2hlbiBpdCBjb21lcyB0byBzZWN1cml0eSBh
bmQgc2FmZXR5LgoKSmFuCgo+Pgo+PiBTbyBzb21lIHF1ZXN0aW9uczoKPj4KPj4gwqDCoCAtIEFt
IEkgbWlzc2luZyBhbnl0aGluZyBvdXQgaW4gdGhhdCBzdW1tYXJ5Pwo+PiDCoMKgIC0gSG93IGFi
b3V0IEh5cGVyViBhbmQgdGhlIE9TWCBlcXVpdmFsZW50Pwo+PiDCoMKgIC0gRG8gYW55IG90aGVy
IHR5cGUtMSBoeXBlcnZpc29ycyBzdXBwb3J0IHZpcnRpbz8KPiAKPiAgRnJvbSB0aGUgdG9wIG9m
IG15IGhlYWQsIHNvbWUgb3RoZXIgaHlwZXJ2aXNvcnMgd2l0aCB2aXJ0aW8gc3VwcG9ydCAKPiAo
aXJyZXNwZWN0aXZlIG9mIGFueSBjbGFzc2lmaWNhdGlvbik6Cj4gCj4gaHR0cHM6Ly93aWtpLmZy
ZWVic2Qub3JnL2JoeXZlCj4gaHR0cHM6Ly9wcm9qZWN0YWNybi5vcmcvCj4gaHR0cDovL3d3dy54
aHlwZXJ2aXNvci5vcmcvCj4gaHR0cHM6Ly93d3cub3BlbnN5bmVyZ3kuY29tL2F1dG9tb3RpdmUt
aHlwZXJ2aXNvci8KPiAKPiBCdXQgdGhlcmUgYXJlIGxpa2VseSBtb3JlLgo+IAo+IEphbgo+IAoK
LS0gClNpZW1lbnMgQUcsIENvcnBvcmF0ZSBUZWNobm9sb2d5LCBDVCBSREEgSU9UIFNFUy1ERQpD
b3Jwb3JhdGUgQ29tcGV0ZW5jZSBDZW50ZXIgRW1iZWRkZWQgTGludXgKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
