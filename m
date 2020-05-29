Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEFC1E7632
	for <lists.virtualization@lfdr.de>; Fri, 29 May 2020 08:51:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6A55B86C18;
	Fri, 29 May 2020 06:50:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u-lSGzjmi1kp; Fri, 29 May 2020 06:50:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CBD3887F5A;
	Fri, 29 May 2020 06:50:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96811C0892;
	Fri, 29 May 2020 06:50:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F00AC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 06:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 256FD8929B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 06:50:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jDfy2W+xZYz6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 06:50:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 51B108886B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 06:50:55 +0000 (UTC)
IronPort-SDR: EQk0NlJnxYxm1GPMjh1IABqbOzhE7v+vaQ6c3muuT9XH84nOkRVjYQ7xOssYisSIemxyUZzAID
 YCWin0jrYKEQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 23:50:54 -0700
IronPort-SDR: yua8XKtu+s8uTXp6lxQszfsrwln7XYIAU7mnjksTlB7iQQz8bVoYTbAJP7sqGlvdvjYac1kehL
 8t7+7He4uWGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; d="scan'208";a="285434838"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.252.45.157])
 by orsmga002.jf.intel.com with ESMTP; 28 May 2020 23:50:51 -0700
Date: Fri, 29 May 2020 08:50:51 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v3 0/5] Add a vhost RPMsg API
Message-ID: <20200529065050.GA6002@ubuntu>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
 <044a3b81-e0fd-5d96-80ff-b13e587f9d39@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <044a3b81-e0fd-5d96-80ff-b13e587f9d39@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-remoteproc@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 sound-open-firmware@alsa-project.org
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

SGkgSmFzb24sCgpPbiBGcmksIE1heSAyOSwgMjAyMCBhdCAwMjowMTo1M1BNICswODAwLCBKYXNv
biBXYW5nIHdyb3RlOgo+IAo+IE9uIDIwMjAvNS8yOCDkuIrljYgyOjA1LCBHdWVubmFkaSBMaWFr
aG92ZXRza2kgd3JvdGU6Cj4gPiB2MzoKPiA+IC0gYWRkcmVzcyBzZXZlcmFsIGNoZWNrcGF0Y2gg
d2FybmluZ3MKPiA+IC0gYWRkcmVzcyBjb21tZW50cyBmcm9tIE1hdGhpZXUgUG9pcmllcgo+ID4g
Cj4gPiB2MjoKPiA+IC0gdXBkYXRlIHBhdGNoICM1IHdpdGggYSBjb3JyZWN0IHZob3N0X2Rldl9p
bml0KCkgcHJvdG90eXBlCj4gPiAtIGRyb3AgcGF0Y2ggIzYgLSBpdCBkZXBlbmRzIG9uIGEgZGlm
ZmVyZW50IHBhdGNoLCB0aGF0IGlzIGN1cnJlbnRseQo+ID4gICAgYW4gUkZDCj4gPiAtIGFkZHJl
c3MgY29tbWVudHMgZnJvbSBQaWVycmUtTG91aXMgQm9zc2FydDoKPiA+ICAgICogcmVtb3ZlICJk
ZWZhdWx0IG4iIGZyb20gS2NvbmZpZwo+ID4gCj4gPiBMaW51eCBzdXBwb3J0cyBSUE1zZyBvdmVy
IFZpcnRJTyBmb3IgInJlbW90ZSBwcm9jZXNzb3IiIC9BTVAgdXNlCj4gPiBjYXNlcy4gSXQgY2Fu
IGhvd2V2ZXIgYWxzbyBiZSB1c2VkIGZvciB2aXJ0dWFsaXNhdGlvbiBzY2VuYXJpb3MsCj4gPiBl
LmcuIHdoZW4gdXNpbmcgS1ZNIHRvIHJ1biBMaW51eCBvbiBib3RoIHRoZSBob3N0IGFuZCB0aGUg
Z3Vlc3RzLgo+ID4gVGhpcyBwYXRjaCBzZXQgYWRkcyBhIHdyYXBwZXIgQVBJIHRvIGZhY2lsaXRh
dGUgd3JpdGluZyB2aG9zdAo+ID4gZHJpdmVycyBmb3Igc3VjaCBSUE1zZy1iYXNlZCBzb2x1dGlv
bnMuIFRoZSBmaXJzdCB1c2UgY2FzZSBpcyBhbgo+ID4gYXVkaW8gRFNQIHZpcnR1YWxpc2F0aW9u
IHByb2plY3QsIGN1cnJlbnRseSB1bmRlciBkZXZlbG9wbWVudCwgcmVhZHkKPiA+IGZvciByZXZp
ZXcgYW5kIHN1Ym1pc3Npb24sIGF2YWlsYWJsZSBhdAo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3Ro
ZXNvZnByb2plY3QvbGludXgvcHVsbC8xNTAxL2NvbW1pdHMKPiA+IEEgZnVydGhlciBwYXRjaCBm
b3IgdGhlIEFEU1Agdmhvc3QgUlBNc2cgZHJpdmVyIHdpbGwgYmUgc2VudAo+ID4gc2VwYXJhdGVs
eSBmb3IgcmV2aWV3IG9ubHkgc2luY2UgaXQgY2Fubm90IGJlIG1lcmdlZCB3aXRob3V0IGF1ZGlv
Cj4gPiBwYXRjaGVzIGJlaW5nIHVwc3RyZWFtZWQgZmlyc3QuCj4gCj4gCj4gSGk6Cj4gCj4gSXQg
d291bGQgYmUgaGFyZCB0byBldmFsdWF0ZSB0aGlzIHNlcmllcyB3aXRob3V0IGEgcmVhbCB1c2Vy
LiBTbyBpZgo+IHBvc3NpYmxlLCBJIHN1Z2dlc3QgdG8gcG9zdCB0aGUgYWN0dWFsIHVzZXIgZm9y
IHZob3N0IHJwbXNnIEFQSS4KClN1cmUsIHRoZSB3aG9sZSBzZXJpZXMgaXMgYXZhaWxhYmxlIGF0
IApodHRwczovL2dpdGh1Yi5jb20vdGhlc29mcHJvamVjdC9saW51eC9wdWxsLzE1MDEvY29tbWl0
cyBvciB3b3VsZCB5b3UgCnByZWZlciB0aGUgbWlzc2luZyBwYXRjaGVzIHBvc3RlZCB0byB0aGUg
bGlzdHMgdG9vPwoKVGhhbmtzCkd1ZW5uYWRpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXph
dGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
