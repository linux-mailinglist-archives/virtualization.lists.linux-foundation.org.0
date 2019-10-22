Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EF975DFA27
	for <lists.virtualization@lfdr.de>; Tue, 22 Oct 2019 03:33:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D1619C7F;
	Tue, 22 Oct 2019 01:32:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 545C4C11
	for <virtualization@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 01:32:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id A660889C
	for <virtualization@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 01:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571707974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=o0Lp/gVS/UVZJ6HpPOA1ELyW3Kw/drS4YFNnrvpMCr8=;
	b=dfckT79hWEjNMj7gbZBMXlQ0guUr4rUPvQcqEaIbbuw5b60K7H2eExcPWchzgsA3ePXhIv
	fo0PyeWoAaXEAlqlN6HyMj1CqySMSzpTQd+nJnFfHWAyMp9oouwqjo1khpUlAuYZbdmLDZ
	RWXTFjAQSoUBy6lE+nBd9+93g/AMqvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-384-k9QbnoCZP_WXlFbJr2Vfxw-1; Mon, 21 Oct 2019 21:32:50 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF9221800DC7;
	Tue, 22 Oct 2019 01:32:48 +0000 (UTC)
Received: from [10.72.12.133] (ovpn-12-133.pek2.redhat.com [10.72.12.133])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 936AD10027A1;
	Tue, 22 Oct 2019 01:32:39 +0000 (UTC)
Subject: Re: [RFC 1/2] vhost: IFC VF hardware operation layer
To: Simon Horman <simon.horman@netronome.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>
References: <20191016011041.3441-1-lingshan.zhu@intel.com>
	<20191016011041.3441-2-lingshan.zhu@intel.com>
	<20191016095347.5sb43knc7eq44ivo@netronome.com>
	<075be045-3a02-e7d8-672f-4a207c410ee8@intel.com>
	<20191021163139.GC4486@netronome.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <15d94e61-9b3d-7854-b65e-6fea6db75450@redhat.com>
Date: Tue, 22 Oct 2019 09:32:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191021163139.GC4486@netronome.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: k9QbnoCZP_WXlFbJr2Vfxw-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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

Ck9uIDIwMTkvMTAvMjIg5LiK5Y2IMTI6MzEsIFNpbW9uIEhvcm1hbiB3cm90ZToKPiBPbiBNb24s
IE9jdCAyMSwgMjAxOSBhdCAwNTo1NTozM1BNICswODAwLCBaaHUsIExpbmdzaGFuIHdyb3RlOgo+
PiBPbiAxMC8xNi8yMDE5IDU6NTMgUE0sIFNpbW9uIEhvcm1hbiB3cm90ZToKPj4+IEhpIFpodSwK
Pj4+Cj4+PiB0aGFua3MgZm9yIHlvdXIgcGF0Y2guCj4+Pgo+Pj4gT24gV2VkLCBPY3QgMTYsIDIw
MTkgYXQgMDk6MTA6NDBBTSArMDgwMCwgWmh1IExpbmdzaGFuIHdyb3RlOgo+IC4uLgo+Cj4+Pj4g
K3N0YXRpYyB2b2lkIGlmY3ZmX3JlYWRfZGV2X2NvbmZpZyhzdHJ1Y3QgaWZjdmZfaHcgKmh3LCB1
NjQgb2Zmc2V0LAo+Pj4+ICsJCSAgICAgICB2b2lkICpkc3QsIGludCBsZW5ndGgpCj4+Pj4gK3sK
Pj4+PiArCWludCBpOwo+Pj4+ICsJdTggKnA7Cj4+Pj4gKwl1OCBvbGRfZ2VuLCBuZXdfZ2VuOwo+
Pj4+ICsKPj4+PiArCWRvIHsKPj4+PiArCQlvbGRfZ2VuID0gaW9yZWFkOCgmaHctPmNvbW1vbl9j
ZmctPmNvbmZpZ19nZW5lcmF0aW9uKTsKPj4+PiArCj4+Pj4gKwkJcCA9IGRzdDsKPj4+PiArCQlm
b3IgKGkgPSAwOyBpIDwgbGVuZ3RoOyBpKyspCj4+Pj4gKwkJCSpwKysgPSBpb3JlYWQ4KCh1OCAq
KWh3LT5kZXZfY2ZnICsgb2Zmc2V0ICsgaSk7Cj4+Pj4gKwo+Pj4+ICsJCW5ld19nZW4gPSBpb3Jl
YWQ4KCZody0+Y29tbW9uX2NmZy0+Y29uZmlnX2dlbmVyYXRpb24pOwo+Pj4+ICsJfSB3aGlsZSAo
b2xkX2dlbiAhPSBuZXdfZ2VuKTsKPj4+IFdvdWxkIGl0IGJlIHdpc2UgdG8gbGltaXQgdGhlIG51
bWJlciBvZiBpdGVyYXRpb25zIG9mIHRoZSBsb29wIGFib3ZlPwo+PiBUaGFua3MgYnV0IEkgZG9u
J3QgcXVpdGUgZ2V0IGl0LiBUaGlzIGlzIHVzZWQgdG8gbWFrZSBzdXJlIHRoZSBmdW5jdGlvbgo+
PiB3b3VsZCBnZXQgdGhlIGxhdGVzdCBjb25maWcuCj4gSSBhbSB3b3JyaWVkIGFib3V0IHRoZSBw
b3NzaWJpbGl0eSB0aGF0IGl0IHdpbGwgbG9vcCBmb3JldmVyLgo+IENvdWxkIHRoYXQgaGFwcGVu
Pwo+Cj4gLi4uCgoKTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoZSBmdW5jdGlvbiBoZXJlIGlz
IHNpbWlsYXIgdG8gdmlydGlvIGNvbmZpZyAKZ2VuZXJhdGlvbiBbMV0uIFNvIHRoaXMgY2FuIG9u
bHkgaGFwcGVuIGZvciBhIGJ1Z2d5IGhhcmR3YXJlLgoKVGhhbmtzCgpbMV0gCmh0dHBzOi8vZG9j
cy5vYXNpcy1vcGVuLm9yZy92aXJ0aW8vdmlydGlvL3YxLjEvY3NwcmQwMS92aXJ0aW8tdjEuMS1j
c3ByZDAxLmh0bWwgClNlY3Rpb24gMi40LjEKCgo+Cj4+Pj4gK3N0YXRpYyB2b2lkIGlvX3dyaXRl
NjRfdHdvcGFydCh1NjQgdmFsLCB1MzIgKmxvLCB1MzIgKmhpKQo+Pj4+ICt7Cj4+Pj4gKwlpb3dy
aXRlMzIodmFsICYgKCgxVUxMIDw8IDMyKSAtIDEpLCBsbyk7Cj4+Pj4gKwlpb3dyaXRlMzIodmFs
ID4+IDMyLCBoaSk7Cj4+Pj4gK30KPj4+IEkgc2VlIHRoaXMgbWFjcm8gaXMgYWxzbyBpbiB2aXJ0
aW9fcGNpX21vZGVybi5jCj4+Pgo+Pj4gQXNzdW1pbmcgbG8gYW5kIGhpIGFyZW4ndCBndWFyYW50
ZWVkIHRvIGJlIHNlcXVlbnRpYWwKPj4+IGFuZCB0aHVzIGlvd3JpdGU2NF9oaV9sbygpIGNhbm5v
dCBiZSB1c2VkIHBlcmhhcHMKPj4+IGl0IHdvdWxkIGJlIGdvb2QgdG8gYWRkIGEgY29tbW9uIGhl
bHBlciBzb21ld2hlcmUuCj4+IFRoYW5rcywgSSB3aWxsIHRyeSBhZnRlciB0aGlzIElGQyBwYXRj
aHdvcmssIEkgd2lsbCBjYyB5b3UuCj4gVGhhbmtzLgo+Cj4gLi4uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
