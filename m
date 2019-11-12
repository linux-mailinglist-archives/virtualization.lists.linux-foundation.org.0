Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DB868F906C
	for <lists.virtualization@lfdr.de>; Tue, 12 Nov 2019 14:18:56 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B1C8A142B;
	Tue, 12 Nov 2019 13:18:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 478B3C7C
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 13:18:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 841EA8A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 13:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573564727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=DifWWZ3nxpQ7N+G4DC3RqHsKEjQ6VCW7kyonEbc0we4=;
	b=BdBKy4yCIKQOUZ2fGCM6EW3YV9KsYXcNK5iKVC7VCgIho0OF4uyHQLCd4rsuqCcPNiOYZ/
	m8hc6Dq7eJ0QqiZmoj1lyQLad4o53gFGbPd7/RQtcniD/Z+N0PcMIlJOWUmM4esqhxQR+f
	hyVZ2GL/NPVQpfuRgP7GqeE9dBYii7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-65-cxkwwec0OZC1FrpEEqBZ5g-1; Tue, 12 Nov 2019 08:18:45 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0A82800C61;
	Tue, 12 Nov 2019 13:18:44 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DE201171FF;
	Tue, 12 Nov 2019 13:18:41 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 46C21220463; Tue, 12 Nov 2019 08:18:41 -0500 (EST)
Date: Tue, 12 Nov 2019 08:18:41 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: zhengbin <zhengbin13@huawei.com>
Subject: Re: [PATCH v2] virtiofs: Use static const, not const static
Message-ID: <20191112131841.GA5501@redhat.com>
References: <1573474545-37037-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1573474545-37037-1-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: cxkwwec0OZC1FrpEEqBZ5g-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-fsdevel@vger.kernel.org, mszeredi@redhat.com, stefanha@redhat.com,
	virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gTW9uLCBOb3YgMTEsIDIwMTkgYXQgMDg6MTU6NDVQTSArMDgwMCwgemhlbmdiaW4gd3JvdGU6
Cj4gTW92ZSB0aGUgc3RhdGljIGtleXdvcmQgdG8gdGhlIGZyb250IG9mIGRlY2xhcmF0aW9ucywg
d2hpY2ggcmVzb2x2ZXMKPiBjb21waWxlciB3YXJuaW5ncyB3aGVuIGJ1aWxkaW5nIHdpdGggIlc9
MSI6Cj4gCj4gZnMvZnVzZS92aXJ0aW9fZnMuYzo2ODc6MTogd2FybmluZzog4oCYc3RhdGlj4oCZ
IGlzIG5vdCBhdCBiZWdpbm5pbmcgb2YgZGVjbGFyYXRpb24gWy1Xb2xkLXN0eWxlLWRlY2xhcmF0
aW9uXQo+ICBjb25zdCBzdGF0aWMgc3RydWN0IHZpcnRpb19kZXZpY2VfaWQgaWRfdGFibGVbXSA9
IHsKPiAgXgo+IGZzL2Z1c2UvdmlydGlvX2ZzLmM6NjkyOjE6IHdhcm5pbmc6IOKAmHN0YXRpY+KA
mSBpcyBub3QgYXQgYmVnaW5uaW5nIG9mIGRlY2xhcmF0aW9uIFstV29sZC1zdHlsZS1kZWNsYXJh
dGlvbl0KPiAgY29uc3Qgc3RhdGljIHVuc2lnbmVkIGludCBmZWF0dXJlX3RhYmxlW10gPSB7fTsK
PiAgXgo+IGZzL2Z1c2UvdmlydGlvX2ZzLmM6MTAyOToxOiB3YXJuaW5nOiDigJhzdGF0aWPigJkg
aXMgbm90IGF0IGJlZ2lubmluZyBvZiBkZWNsYXJhdGlvbiBbLVdvbGQtc3R5bGUtZGVjbGFyYXRp
b25dCj4gIGNvbnN0IHN0YXRpYyBzdHJ1Y3QgZnVzZV9pcXVldWVfb3BzIHZpcnRpb19mc19maXFf
b3BzID0gewo+IAo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiB6aGVuZ2JpbiA8emhlbmdiaW4xM0BodWF3ZWkuY29tPgoKQWNrZWQt
Ynk6IFZpdmVrIEdveWFsIDx2Z295YWxAcmVkaGF0LmNvbT4KClZpdmVrCj4gLS0tCj4gdjEtPnYy
OiBtb2RpZnkgY29tbWVudAo+ICBmcy9mdXNlL3ZpcnRpb19mcy5jIHwgNiArKystLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZnMvZnVzZS92aXJ0aW9fZnMuYyBiL2ZzL2Z1c2UvdmlydGlvX2ZzLmMKPiBpbmRleCBi
NzdhY2VhLi4yYWM2ODE4IDEwMDY0NAo+IC0tLSBhL2ZzL2Z1c2UvdmlydGlvX2ZzLmMKPiArKysg
Yi9mcy9mdXNlL3ZpcnRpb19mcy5jCj4gQEAgLTY4NCwxMiArNjg0LDEyIEBAIHN0YXRpYyBpbnQg
dmlydGlvX2ZzX3Jlc3RvcmUoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCj4gIH0KPiAgI2Vu
ZGlmIC8qIENPTkZJR19QTV9TTEVFUCAqLwo+IAo+IC1jb25zdCBzdGF0aWMgc3RydWN0IHZpcnRp
b19kZXZpY2VfaWQgaWRfdGFibGVbXSA9IHsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCB2aXJ0aW9f
ZGV2aWNlX2lkIGlkX3RhYmxlW10gPSB7Cj4gIAl7IFZJUlRJT19JRF9GUywgVklSVElPX0RFVl9B
TllfSUQgfSwKPiAgCXt9LAo+ICB9Owo+IAo+IC1jb25zdCBzdGF0aWMgdW5zaWduZWQgaW50IGZl
YXR1cmVfdGFibGVbXSA9IHt9Owo+ICtzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IGZlYXR1cmVf
dGFibGVbXSA9IHt9Owo+IAo+ICBzdGF0aWMgc3RydWN0IHZpcnRpb19kcml2ZXIgdmlydGlvX2Zz
X2RyaXZlciA9IHsKPiAgCS5kcml2ZXIubmFtZQkJPSBLQlVJTERfTU9ETkFNRSwKPiBAQCAtMTAy
Niw3ICsxMDI2LDcgQEAgX19yZWxlYXNlcyhmaXEtPmxvY2spCj4gIAl9Cj4gIH0KPiAKPiAtY29u
c3Qgc3RhdGljIHN0cnVjdCBmdXNlX2lxdWV1ZV9vcHMgdmlydGlvX2ZzX2ZpcV9vcHMgPSB7Cj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgZnVzZV9pcXVldWVfb3BzIHZpcnRpb19mc19maXFfb3BzID0g
ewo+ICAJLndha2VfZm9yZ2V0X2FuZF91bmxvY2sJCT0gdmlydGlvX2ZzX3dha2VfZm9yZ2V0X2Fu
ZF91bmxvY2ssCj4gIAkud2FrZV9pbnRlcnJ1cHRfYW5kX3VubG9jawk9IHZpcnRpb19mc193YWtl
X2ludGVycnVwdF9hbmRfdW5sb2NrLAo+ICAJLndha2VfcGVuZGluZ19hbmRfdW5sb2NrCT0gdmly
dGlvX2ZzX3dha2VfcGVuZGluZ19hbmRfdW5sb2NrLAo+IC0tCj4gMi43LjQKPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
