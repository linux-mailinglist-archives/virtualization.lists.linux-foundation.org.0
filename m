Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 275F0EA8EA
	for <lists.virtualization@lfdr.de>; Thu, 31 Oct 2019 02:44:34 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C25D0EEA;
	Thu, 31 Oct 2019 01:44:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3A9D8DC9
	for <virtualization@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 01:44:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
	[205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 16A2F8A
	for <virtualization@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 01:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572486262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=4tc+kGwmBYkHh3r+P2hKVHCMVc/QGj3NROan5F4N/4I=;
	b=OrEB0O0cTPVrKKFY3kRbDS1m+afKuwRyVp2KxiK1anbj0UZt9WKQl6ohyHTnWPMqa+PkAg
	ZPBG3yTp6IBI5YI6CCzY97snHMznV5F2eFsEzg/KqkMT818roJXmLOUpPnJJNa+J6XgtU/
	yC9J18HdWCbzqku8b4w5xlZvtRRE++Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-374-EZPixSApMXCjMTJG_WhWEw-1; Wed, 30 Oct 2019 21:44:19 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A8A11005500;
	Thu, 31 Oct 2019 01:44:18 +0000 (UTC)
Received: from [10.72.12.100] (ovpn-12-100.pek2.redhat.com [10.72.12.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7771160132;
	Thu, 31 Oct 2019 01:44:12 +0000 (UTC)
Subject: Re: [RFC] vhost_mdev: add network control vq support
To: Tiwei Bie <tiwei.bie@intel.com>
References: <20191029101726.12699-1-tiwei.bie@intel.com>
	<59474431-9e77-567c-9a46-a3965f587f65@redhat.com>
	<20191030061711.GA11968@___>
	<39aa9f66-8e58-ea63-5795-7df8861ff3a0@redhat.com>
	<20191030115433.GA27220@___>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b1ab03ec-edb0-f955-2719-beb0653feed1@redhat.com>
Date: Thu, 31 Oct 2019 09:44:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191030115433.GA27220@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: EZPixSApMXCjMTJG_WhWEw-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, lingshan.zhu@intel.com
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

Ck9uIDIwMTkvMTAvMzAg5LiL5Y2INzo1NCwgVGl3ZWkgQmllIHdyb3RlOgo+IE9uIFdlZCwgT2N0
IDMwLCAyMDE5IGF0IDAzOjA0OjM3UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+IE9uIDIw
MTkvMTAvMzAg5LiL5Y2IMjoxNywgVGl3ZWkgQmllIHdyb3RlOgo+Pj4gT24gVHVlLCBPY3QgMjks
IDIwMTkgYXQgMDY6NTE6MzJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+PiBPbiAyMDE5
LzEwLzI5IOS4i+WNiDY6MTcsIFRpd2VpIEJpZSB3cm90ZToKPj4+Pj4gVGhpcyBwYXRjaCBhZGRz
IHRoZSBuZXR3b3JrIGNvbnRyb2wgdnEgc3VwcG9ydCBpbiB2aG9zdC1tZGV2Lgo+Pj4+PiBBIHZo
b3N0LW1kZXYgc3BlY2lmaWMgb3AgaXMgaW50cm9kdWNlZCB0byBhbGxvdyBwYXJlbnQgZHJpdmVy
cwo+Pj4+PiB0byBoYW5kbGUgdGhlIG5ldHdvcmsgY29udHJvbCBjb21tYW5kcyBjb21lIGZyb20g
dXNlcnNwYWNlLgo+Pj4+IFByb2JhYmx5IHdvcmsgZm9yIHVzZXJzcGFjZSBkcml2ZXIgYnV0IG5v
dCBrZXJuZWwgZHJpdmVyLgo+Pj4gRXhhY3RseS4gVGhpcyBpcyBvbmx5IGZvciB1c2Vyc3BhY2Uu
Cj4+Pgo+Pj4gSSBnb3QgeW91ciBwb2ludCBub3cuIEluIHZpcnRpby1tZGV2IGtlcm5lbCBkcml2
ZXIgY2FzZSwKPj4+IHRoZSBjdHJsLXZxIGNhbiBiZSBzcGVjaWFsIGFzIHdlbGwuCj4+Pgo+PiBU
aGVuIG1heWJlIGl0J3MgYmV0dGVyIHRvIGludHJvZHVjZSB2aG9zdC1tZGV2LW5ldCBvbiB0b3A/
Cj4+Cj4+IExvb2tpbmcgYXQgdGhlIG90aGVyIHR5cGUgb2YgdmlydGlvIGRldmljZToKPj4KPj4g
LSBjb25zb2xlIGhhdmUgdHdvIGNvbnRyb2wgdmlydHF1ZXVlcyB3aGVuIG11bHRpcXVldWUgcG9y
dCBpcyBlbmFibGVkCj4+Cj4+IC0gU0NTSSBoYXMgY29udHJvbHEgKyBldmVudHEKPj4KPj4gLSBH
UFUgaGFzIGNvbnRyb2xxCj4+Cj4+IC0gQ3J5cHRvIGRldmljZSBoYXMgb25lIGNvbnRyb2xxCj4+
Cj4+IC0gU29ja2V0IGhhcyBldmVudHEKPj4KPj4gLi4uCj4gVGhhbmtzIGZvciB0aGUgbGlzdCEg
SXQgbG9va3MgZGlydHkgdG8gZGVmaW5lIHNwZWNpZmljCj4gY29tbWFuZHMgYW5kIHR5cGVzIGlu
IHZob3N0IFVBUEkgZm9yIGVhY2ggb2YgdGhlbSBpbiB0aGUKPiBmdXR1cmUuIEl0J3MgZGVmaW5p
dGVseSBtdWNoIGJldHRlciB0byBmaW5kIGFuIGFwcHJvYWNoCj4gdG8gc29sdmUgaXQgb25jZSBm
b3IgYWxsIGlmIHBvc3NpYmxlLi4KPgo+IEp1c3QgYSBxdWljayB0aG91Z2h0LCBjb25zaWRlcmlu
ZyBhbGwgdmhvc3QtbWRldiBkb2VzCj4gaXMganVzdCB0byBmb3J3YXJkIHNldHRpbmdzIGJldHdl
ZW4gcGFyZW50IGFuZCB1c2Vyc3BhY2UsCj4gSSdtIHdvbmRlcmluZyB3aGV0aGVyIGl0J3MgcG9z
c2libGUgdG8gbWFrZSB0aGUgYXJncAo+IG9wYXF1ZSBpbiB2aG9zdC1tZGV2IFVBUEkgYW5kIGp1
c3QgaW50cm9kdWNlIG9uZSBnZW5lcmljCj4gaW9jdGwgY29tbWFuZCB0byBkZWxpdmVyIHRoZXNl
IGRldmljZSBzcGVjaWZpYyBjb21tYW5kcwo+ICh3aGljaCBhcmUgb3BhcXVlIGluIHZob3N0LW1k
ZXYgYXMgdmhvc3QtbWRldiBqdXN0IHBhc3MKPiB0aGUgcG9pbnRlciAtLSBhcmdwKSBkZWZpbmVk
IGJ5IHNwZWMuCgoKSXQgbG9va3MgdGhhdCB1c2luZyBvcGFxdWUgcG9pbnRlciBpcyBwcm9iYWJs
eSBub3QgZ29vZCBmb3IgVUFQSS4gQW5kIHdlIApuZWVkIGFsc28gaW52ZW50IEFQSSBmb3IgZXZl
bnRxLgoKCj4KPiBJJ20gYWxzbyBmaW5lIHdpdGggZXhwb3NpbmcgY3RybHEgdG8gdXNlcnNwYWNl
IGRpcmVjdGx5Lgo+IFBTLiBJdCdzIGludGVyZXN0aW5nIHRoYXQgc29tZSBkZXZpY2VzIGhhdmUg
bW9yZSB0aGFuCj4gb25lIGN0cmxxLiBJIG5lZWQgdG8gdGFrZSBhIGNsb3NlIGxvb2sgZmlyc3Qu
LgoKClRoYW5rcy4KCgo+Cj4KPj4gVGhhbmtzCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
