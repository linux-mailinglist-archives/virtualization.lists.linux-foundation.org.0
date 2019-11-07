Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CD0F263D
	for <lists.virtualization@lfdr.de>; Thu,  7 Nov 2019 05:09:08 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 226CCC3E;
	Thu,  7 Nov 2019 04:09:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8C8FAB5F
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 04:08:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 13AF0756
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 04:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573099737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=YSIEdqcLrogv35u/q3ac44m/gQYEQosg5vjXwg1Frog=;
	b=Kv5Shbw2uYdpjl7xPUJp0kikDCTV436Av2zR0n2DdCcWiHGK1mx9guuVQYRsSaiuc0yLwY
	bWa3ixK3Cg8XwDj6dRa/hMwkQAeiLkdAsLgP6NNPVVw5Vm78dxJEUheCTNiOQu6/1UbsHx
	kPgHiYQeyJ3EIdD04wf9j0IrUrZt+bw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-355-b64OKsVqNKabWfY1H8bGSQ-1; Wed, 06 Nov 2019 23:08:54 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3D7B107ACC3;
	Thu,  7 Nov 2019 04:08:52 +0000 (UTC)
Received: from [10.72.12.214] (ovpn-12-214.pek2.redhat.com [10.72.12.214])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4851960870;
	Thu,  7 Nov 2019 04:08:16 +0000 (UTC)
Subject: Re: [PATCH v5] vhost: introduce mdev based hardware backend
To: Tiwei Bie <tiwei.bie@intel.com>
References: <20191105115332.11026-1-tiwei.bie@intel.com>
	<16f31c27-3a0e-09d7-3925-dc9777f5e229@redhat.com>
	<20191106122249.GA3235@___>
	<20191106075607-mutt-send-email-mst@kernel.org>
	<580dfa2c-f1ff-2f6f-bbc8-1c4b0a829a3d@redhat.com>
	<20191106144952.GA10926@___>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <914081d6-40ee-f184-ff43-c3d4cd885fba@redhat.com>
Date: Thu, 7 Nov 2019 12:08:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191106144952.GA10926@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: b64OKsVqNKabWfY1H8bGSQ-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, maxime.coquelin@redhat.com, lingshan.zhu@intel.com
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

Ck9uIDIwMTkvMTEvNiDkuIvljYgxMDo0OSwgVGl3ZWkgQmllIHdyb3RlOgo+Pj4+Pj4gKwlkZWZh
dWx0Ogo+Pj4+Pj4gKwkJLyoKPj4+Pj4+ICsJCSAqIFZIT1NUX1NFVF9NRU1fVEFCTEUsIFZIT1NU
X1NFVF9MT0dfQkFTRSwgYW5kCj4+Pj4+PiArCQkgKiBWSE9TVF9TRVRfTE9HX0ZEIGFyZSBub3Qg
dXNlZCB5ZXQuCj4+Pj4+PiArCQkgKi8KPj4+Pj4gSWYgd2UgZG9uJ3QgZXZlbiB1c2UgdGhlbSwg
dGhlcmUncyBwcm9iYWJseSBubyBuZWVkIHRvIGNhbGwKPj4+Pj4gdmhvc3RfZGV2X2lvY3RsKCku
IFRoaXMgbWF5IGhlbHAgdG8gYXZvaWQgY29uZnVzaW9uIHdoZW4gd2Ugd2FudCB0byBkZXZlbG9w
Cj4+Pj4+IG5ldyBBUEkgZm9yIGUuZyBkaXJ0eSBwYWdlIHRyYWNraW5nLgo+Pj4+IEdvb2QgcG9p
bnQuIEl0J3MgYmV0dGVyIHRvIHJlamVjdCB0aGVzZSBpb2N0bHMgZm9yIG5vdy4KPj4+Pgo+Pj4+
IFBTLiBPbmUgdGhpbmcgSSBtYXkgbmVlZCB0byBjbGFyaWZ5IGlzIHRoYXQsIHdlIG5lZWQgdGhl
Cj4+Pj4gVkhPU1RfU0VUX09XTkVSIGlvY3RsIHRvIGdldCB0aGUgdnEtPmhhbmRsZV9raWNrIHRv
IHdvcmsuCj4+Pj4gU28gaWYgd2UgZG9uJ3QgY2FsbCB2aG9zdF9kZXZfaW9jdGwoKSwgd2Ugd2ls
bCBuZWVkIHRvCj4+Pj4gY2FsbCB2aG9zdF9kZXZfc2V0X293bmVyKCkgZGlyZWN0bHkuCj4+IEkg
bWF5IG1pc3Mgc29tZXRoaW5nLCBpdCBsb29rcyB0byBtZSB0aGUgdGhlcmUncyBubyBvd25lciBj
aGVjayBpbgo+PiB2aG9zdF92cmluZ19pb2N0bCgpIGFuZCB0aGUgdmhvc3RfcG9sbF9zdGFydCgp
IGNhbiBtYWtlIHN1cmUgaGFuZGxlX2tpY2sKPj4gd29ya3M/Cj4gWWVhaCwgdGhlcmUgaXMgbm8g
b3duZXIgY2hlY2sgaW4gdmhvc3RfdnJpbmdfaW9jdGwoKS4KPiBJSVVDLCB2aG9zdF9wb2xsX3N0
YXJ0KCkgd2lsbCBzdGFydCBwb2xsaW5nIHRoZSBmaWxlLiBBbmQgd2hlbgo+IGV2ZW50IGFycml2
ZXMsIHZob3N0X3BvbGxfd2FrZXVwKCkgd2lsbCBiZSBjYWxsZWQsIGFuZCBpdCB3aWxsCj4gcXVl
dWUgd29yayB0byB3b3JrX2xpc3QgYW5kIHdha2V1cCB3b3JrZXIgdG8gZmluaXNoIHRoZSB3b3Jr
Lgo+IEFuZCB0aGUgd29ya2VyIGlzIGNyZWF0ZWQgYnkgdmhvc3RfZGV2X3NldF9vd25lcigpLgo+
CgpSaWdodCwgcmV0aGluayBhYm91dCB0aGlzLiBJdCBsb29rcyB0byBtZSB3ZSBuZWVkOgoKLSBL
ZWVwIFZIT1NUX1NFVF9PV05FUiwgdGhpcyBjb3VsZCBiZSB1c2VkIGZvciBmdXR1cmUgY29udHJv
bCB2cSB3aGVyZSAKaXQgbmVlZHMgYSBrdGhyZWFkIHRvIGFjY2VzcyB0aGUgdXNlcnNwYWNlIG1l
bW9yeQoKLSBUZW1wb3JhcmlseSBmaWx0ZXLCoCBTRVRfTE9HX0JBU0UgYW5kIFNFVF9MT0dfRkQg
dW50aWwgd2UgZmluYWxpemUgdGhlIApBUEkgZm9yIGRpcnR5IHBhZ2UgdHJhY2tpbmcuCgotIEZv
ciBraWNrIHRocm91Z2gga3RocmVhZCwgaXQgbG9va3Mgc3ViLW9wdGltYWwgYnV0IHdlIGNhbiBh
ZGRyZXNzIHRoaXMgCmluIHRoZSBmdXR1cmUsIGUuZyBjYWxsIGhhbmRsZV92cV9raWNrIGRpcmVj
dGx5IGluIHZob3N0X3BvbGxfcXVldWUgCihwcm9iYWJseSBhIGZsYWcgZm9yIHZob3N0X3BvbGwp
IGFuZCBkZWFsIHdpdGggdGhlIHN5bmNocm9uaXphdGlvbiBpbiAKdmhvc3RfcG9sbF9mbHVzaCBj
YXJlZnVsbHkuCgpUaGFua3MKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
