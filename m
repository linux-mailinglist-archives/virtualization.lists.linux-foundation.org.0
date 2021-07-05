Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 600AC3BB725
	for <lists.virtualization@lfdr.de>; Mon,  5 Jul 2021 08:22:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFF2C839DB;
	Mon,  5 Jul 2021 06:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ORZrpiwKXc7G; Mon,  5 Jul 2021 06:22:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CE7CD83A4D;
	Mon,  5 Jul 2021 06:22:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 537B0C000E;
	Mon,  5 Jul 2021 06:22:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 002A4C000E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 06:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F042160796
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 06:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X2FpfY1M5w7X
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 06:22:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2752F605DD
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 06:22:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10035"; a="205921192"
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="205921192"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2021 23:22:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="562409136"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58])
 ([10.239.154.58])
 by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2021 23:22:15 -0700
Subject: Re: [PATCH v12] i2c: virtio: add a virtio i2c frontend driver
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <f229cd761048bc143f88f33a3437bdbf891c39fd.1625214435.git.jie.deng@intel.com>
 <20210705024056.ndth2bwn2itii5g3@vireshk-i7>
 <332af2be-0fb0-a846-8092-49d496fe8b6b@intel.com>
 <20210705043841.zujwo672nfdndpg2@vireshk-i7>
From: Jie Deng <jie.deng@intel.com>
Message-ID: <6aabc877-673a-e2bc-da2d-ec6741b4159b@intel.com>
Date: Mon, 5 Jul 2021 14:22:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210705043841.zujwo672nfdndpg2@vireshk-i7>
Content-Language: en-US
Cc: yu1.wang@intel.com, arnd@arndb.de, mst@redhat.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 wsa@kernel.org, wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org,
 stefanha@redhat.com, shuo.a.liu@intel.com, andriy.shevchenko@linux.intel.com,
 conghui.chen@intel.com
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

Ck9uIDIwMjEvNy81IDEyOjM4LCBWaXJlc2ggS3VtYXIgd3JvdGU6Cj4gT24gMDUtMDctMjEsIDEx
OjQ1LCBKaWUgRGVuZyB3cm90ZToKPj4gT24gMjAyMS83LzUgMTA6NDAsIFZpcmVzaCBLdW1hciB3
cm90ZToKPj4+IE9uIDAyLTA3LTIxLCAxNjo0NiwgSmllIERlbmcgd3JvdGU6Cj4+PiBUaGUgcmln
aHQgd2F5IG9mIGRvaW5nIHRoaXMgaXMgaXMgbWFraW5nIHRoaXMgZnVuY3Rpb24gcmV0dXJuIC0g
RXJyb3Igb24gZmFpbHVyZQo+Pj4gYW5kIDAgb24gc3VjY2Vzcy4gVGhlcmUgaXMgbm8gcG9pbnQg
cmV0dXJuaW5nIG51bWJlciBvZiBzdWNjZXNzZnVsIGFkZGl0aW9ucwo+Pj4gaGVyZS4KPj4KPj4g
V2UgbmVlZCB0aGUgbnVtYmVyIGZvciB2aXJ0aW9faTJjX2NvbXBsZXRlX3JlcXMgdG8gZG8gY2xl
YW51cC4gV2UgZG9uJ3QgaGF2ZQo+PiB0bwo+Pgo+PiBkbyBjbGVhbnVwICJudW0iIHRpbWVzIGV2
ZXJ5IHRpbWUuIEp1c3QgZG8gaXQgYXMgbmVlZGVkLgo+IElmIHlvdSBkbyBmdWxsIGNsZWFudXAg
aGVyZSwgdGhlbiB5b3Ugd29uJ3QgcmVxdWlyZWQgdGhhdCBhdCB0aGUgY2FsbGVyIHNpdGUuCj4K
Pj4+IE1vcmVvdmVyLCBvbiBmYWlsdXJlcyB0aGlzIG5lZWRzIHRvIGNsZWFuIHVwIChmcmVlIHRo
ZSBkbWFidWZzKSBpdHNlbGYsIGp1c3QKPj4+IGxpa2UgeW91IGRpZCBpMmNfcHV0X2RtYV9zYWZl
X21zZ19idWYoKSBhdCB0aGUgZW5kLiBUaGUgY2FsbGVyIHNob3VsZG4ndCBiZQo+Pj4gcmVxdWly
ZWQgdG8gaGFuZGxlIHRoZSBlcnJvciBjYXNlcyBieSBmcmVlaW5nIHVwIHJlc291cmNlcy4KPj4K
Pj4gVGhpcyBmdW5jdGlvbiB3aWxsIHJldHVybiB0aGUgbnVtYmVyIG9mIHJlcXVlc3RzIGJlaW5n
IHN1Y2Nlc3NmdWxseSBwcmVwYXJlZAo+PiBhbmQgbWFrZSBzdXJlCj4+Cj4+IHJlc291cmNlcyBv
ZiB0aGUgZmFpbGVkIHJlcXVlc3QgYmVpbmcgZnJlZWQuIEFuZCB2aXJ0aW9faTJjX2NvbXBsZXRl
X3JlcXMKPj4gd2lsbCBmcmVlIHRoZQo+Pgo+PiByZXNvdXJjZXMgb2YgdGhvc2Ugc3VjY2Vzc2Z1
bCByZXF1ZXN0Lgo+IEl0IGp1c3QgbG9va3MgY2xlYW5lciB0byBnaXZlIHN1Y2ggcmVzcG9uc2li
aWxpdHkgdG8gZWFjaCBhbmQgZXZlcnkgZnVuY3Rpb24sCj4gaS5lLiBpZiB0aGV5IGZhaWwsIHRo
ZXkgc2hvdWxkIGNsZWFuIHN0dWZmIHVwIGluc3RlYWQgb2YgdGhlIGNhbGxlci4gVGhhdCdzIHRo
ZQo+IG5vcm1hbCBwaGlsb3NvcGh5IHlvdSB3aWxsIGZpbmQgYWNyb3NzIGtlcm5lbCBpbiBtb3N0
IG9mIHRoZSBjYXNlcy4KPiAgIAo+Pj4+ICsJCS8qCj4+Pj4gKwkJICogQ29uZGl0aW9uIChyZXEg
JiYgcmVxID09ICZyZXFzW2ldKSBzaG91bGQgYWx3YXlzIG1lZXQgc2luY2UKPj4+PiArCQkgKiB3
ZSBoYXZlIHRvdGFsIG5yIHJlcXVlc3RzIGluIHRoZSB2cS4KPj4+PiArCQkgKi8KPj4+PiArCQlp
ZiAoIWZhaWxlZCAmJiAoV0FSTl9PTighKHJlcSAmJiByZXEgPT0gJnJlcXNbaV0pKSB8fAo+Pj4+
ICsJCSAgICAocmVxLT5pbl9oZHIuc3RhdHVzICE9IFZJUlRJT19JMkNfTVNHX09LKSkpCj4+PiBX
aGF0IGFib3V0IHdyaXRpbmcgdGhpcyBhczoKPj4+Cj4+PiAJCWlmICghZmFpbGVkICYmIChXQVJO
X09OKHJlcSAhPSAmcmVxc1tpXSkgfHwKPj4+IAkJICAgIChyZXEtPmluX2hkci5zdGF0dXMgIT0g
VklSVElPX0kyQ19NU0dfT0spKSkKPj4+Cj4+PiBXZSBkb24ndCBuZWVkIHRvIGNoZWNrIHJlcSBo
ZXJlIHNpbmNlIGlmIHJlcSBpcyBOVUxMLCB3ZSB3aWxsIG5vdCBkbyByZXEtPmluX2hkcgo+Pj4g
YXQgYWxsLgo+Pgo+PiBJdCdzIHJpZ2h0IGhlcmUganVzdCBiZWNhdXNlIHRoZSAmcmVxc1tpXSB3
aWxsIG5ldmVyIGJlIE5VTEwgaW4gb3VyIGNhc2UuCj4+IEJ1dCBpZiB5b3Ugc2VlCj4+Cj4+ICJ2
aXJ0aW9faTJjX2NvbXBsZXRlX3JlcXMiIGFzIGFuIGluZGVwZW5kZW50IGZ1bmN0aW9uLCB5b3Ug
bmVlZCB0byBjaGVjayB0aGUKPj4KPj4gcmVxLiBGcm9tIHRoZSBwZXJzcGVjdGl2ZSBvZiB0aGUg
Y2FsbGVlLCB5b3UgY2FuJ3QgYXNrIHRoZSBjYWxsZXIgYWx3YXlzCj4+IGdpdmUgeW91Cj4+Cj4+
IHRoZSBub24tTlVMTCBwYXJhbWV0ZXJzLgo+IFdlIG5lZWQgdG8ga2VlcCB0aGlzIGRyaXZlciBv
cHRpbWl6ZWQgaW4gaXRzIGN1cnJlbnQgZm9ybS4gSWYgeW91IHNlZSB5b3VyIG93bgo+IGFyZ3Vt
ZW50IGhlcmUsIHRoZW4gd2h5IGRvbid0IHlvdSB0ZXN0IHZxIG9yIG1zZ3MgZm9yIGEgdmFsaWQg
cG9pbnRlciA/IEFuZCBldmVuCj4gcmVxcy4KPgo+IElmIHdlIGtub3cgZm9yIGNlcnRhaW4gdGhh
dCB0aGlzIHdpbGwgbmV2ZXIgaGFwcGVuLCB0aGVuIGl0IHNob3VsZCBiZSBvcHRpbWl6ZWQuCj4g
QnV0IGlmIHlvdSBzZWUgYSBjYXNlIHdoZXJlIHJlcXNbaV0gY2FuIGJlIE5VTEwgaGVyZSwgdGhl
biBpdCB3b3VsZCBiZSBmaW5lLgo+IG90IHRoZSBkcml2ZXIuIEFuZCB3ZSBkb24ndCBuZWVkIHRv
IHRha2UgY2FyZSBvZiB0aGF0LgoKClRoaXMgaXMgc3RpbGwgbm90IGVub3VnaCB0byBjb252aW5j
ZSBtZS7CoCBTbyBJIHdvbid0IGNoYW5nZSB0aGVtIGZvciBub3cgCnVudGlsIEkgc2VlIGl0Cgpp
cyB0aGUgY29uc2Vuc3VzIG9mIHRoZSBtYWpvcml0eS4KClRoYW5rIHlvdS4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWls
aW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRp
b24=
