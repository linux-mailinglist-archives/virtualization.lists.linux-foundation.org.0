Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3978D1BEEC0
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 05:56:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D068987CEC;
	Thu, 30 Apr 2020 03:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RbgXXwmmoFap; Thu, 30 Apr 2020 03:56:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AAD9587CEB;
	Thu, 30 Apr 2020 03:56:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F399C0172;
	Thu, 30 Apr 2020 03:56:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A055C0172
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 03:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3855C86356
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 03:56:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GxZsN4ENzvA7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 03:56:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3AEE585424
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 03:56:23 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id v28so17354lfp.6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 20:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cMjnW0mwNixGwwV4kBWdBrcFo7MxccuF08xNpRFW8FU=;
 b=To8ExjFPXo6wcAVTz4UbOVTBqp14u8X9Obppt4TOGX11K0FeFmHRe7WEerzmfdKkza
 ufEe5uXQlhCK2+ojEKVcwN84WAwKuf/U9YcNda6CGYkvT/SvVPxfJ9BzB1VyI69Yo9Tq
 2mQ+Lcaa1NUGUi/NCuq/RmpulnLFVKmDVmgs142k5x0o6KN659kyAh3+kvlFC4jSH9x3
 Nrf8KOHrztOeH08I+vOb/2QzPjyuI2MfHMuwCxprjaTpYVj2tz5nRzu4OtvI09umdllB
 2xkDJNZxGDQkjopjmi8NJxNhV0O0Og1xaRC3G4DWs+YeW6Meovo6Evx4aNdWvOohPFmq
 pMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cMjnW0mwNixGwwV4kBWdBrcFo7MxccuF08xNpRFW8FU=;
 b=qS845lhvmJ1oQ7zXky/OYcmt6Qdec/SF3mbnXP2QxwNL/RhRV1HjNMM+gm0imfNaTj
 ar8wU4za1telDnmzZdrgZYwNxO+MZHBH61ixW8JkGPzx7JNBEVBmabXaTYDimAkxtdNP
 RSw6kvesbwBy5YNBzlI+NLuwQyYz4o9+yPYjcKXsUSPbB2l+qhXrsYXISPo1zI6uu8du
 v46Y1r0hAmSKbvSwPVSB90lYMUjEx3rTdQY/5mLsYjFAfIyOry8YSRNnRkpKVgbBIbyn
 Tkf+g9uDNzaS/lY+DTWoLJNS0uopnn3X0xsjxJ1oj43WNt1o94Oz4jWyZ/it/0IM0GRj
 8zuw==
X-Gm-Message-State: AGi0PuZZKUOTVWE6SIC1KkSUZ0A/U0zTWV8OUZBy3O8y4egc+S+u7Azx
 e1AW2EuZ9Pix8FNXTWxrP4wRD/hEf0965Ci4Zto=
X-Google-Smtp-Source: APiQypKnchppwHlvjuh6FIS/nI0atEPFVpLpFBiUSUVlsuTlNCIhz3EvCOeFGLe4CgxZQk1v4QEq73ot2ZTCYKqP0Y0=
X-Received: by 2002:a05:6512:686:: with SMTP id
 t6mr702472lfe.163.1588218981028; 
 Wed, 29 Apr 2020 20:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200428204729.64569-1-ytht.net@gmail.com>
 <b01454e9-bca8-cf32-7cfa-ebe25032e040@redhat.com>
In-Reply-To: <b01454e9-bca8-cf32-7cfa-ebe25032e040@redhat.com>
From: lepton <ytht.net@gmail.com>
Date: Wed, 29 Apr 2020 20:56:09 -0700
Message-ID: <CALqoU4yK3ffLJDQ8GcEdoGM8XPGLF7u0skdNN1gii9qa7UeFDw@mail.gmail.com>
Subject: Re: [PATCH 0/1] Add uvirtio for testing
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, virtualization@lists.linux-foundation.org
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

T24gV2VkLCBBcHIgMjksIDIwMjAgYXQgMjo1NyBBTSBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRo
YXQuY29tPiB3cm90ZToKPgo+Cj4gT24gMjAyMC80LzI5IOS4iuWNiDQ6NDcsIExlcHRvbiBXdSB3
cm90ZToKPiA+IFRoaXMgaXMgYSB3YXkgdG8gY3JlYXRlIHZpcnRpbyBiYXNlZCBkZXZpY2VzIGZy
b20gdXNlciBzcGFjZS4gVGhpcyBpcyB0aGUKPiA+IGJhY2tncm91bmQgZm9yIHRoaXMgcGF0Y2g6
Cj4gPgo+ID4gV2UgaGF2ZSBzb21lIGltYWdlcyB3b3JrcyBmaW5lIHVuZGVyIHFlbXUsIHdlJ2Qg
bGlrZSB0byBhbHNvIHJ1biB0aGUgc2FtZSBpbWFnZQo+ID4gb24gR29vZ2xlIENsb3VkLiBDdXJy
ZW50bHkgR29vZ2xlIENsb3VkIGRvZXNuJ3Qgc3VwcG9ydCB2aXJ0aW8tdmdhLiBJIGhhZCBhCj4g
PiBwYXRjaCB0byBjcmVhdGUgYSB2aXJ0aW8tdmdhIGZyb20ga2VybmVsIGRpcmVjdGx5Ogo+ID4g
aHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvZHJpLWRldmVsL21zZzI0ODU3My5odG1sCj4g
Pgo+ID4gVGhlbiBJIGdvdCBmZWVkYmFjayBmcm9tIEdlcmQgdGhhdCBtYXliZSBpdCdzIGJldHRl
ciB0byBjaGFuZ2UgdGhhdCB0byBzb21ldGhpbmcKPiA+IGxpa2UgdXZpcnRpby4gU2luY2UgSSBy
ZWFsbHkgZG9uJ3QgaGF2ZSBvdGhlciB1c2UgY2FzZXMgZm9yIG5vdywgSSBqdXN0IGltcGxlbWVu
dGVkIHRoZSBtaW5pbWFsIHN0dWZmIHdoaWNoIHdvcmsgZm9yIG15IHVzZSBjYXNlLgo+Cj4KPiBJ
bnRlcmVzdGluZywgc2V2ZXJhbCBxdWVzdGlvbnM6Cj4KPiAxKSBBcmUgeW91IGF3YXJlIG9mIHZp
cnRpbyB2aG9zdC11c2VyIGRyaXZlciBkb25lIGJ5IFVNIGd1eXM/Cj4gKGFyY2gvdW0vZHJpdmVy
cy92aXJ0aW9fdW1sLmMpIFRoZSBtZW1vcnkgcGFydCBpcyB0cmlja3kgYnV0IG92ZXJhbGwKPiBi
b3RoIG9mIHlvdSBoYXZlIHNpbWlsYXIgdGFyZ2V0LgpUaGFua3MgZm9yIHJlbWluZGluZyBtZSwg
SSB3YXMgbm90IGF3YXJlIG9mIGl0LiBUaGUgdXNlIGNhc2UgbG9va3MgYQpsaXR0bGUgZGlmZmVy
ZW50OiB0aGV5IGFyZSB0cnlpbmcgY3JlYXRlIHZpcnRpbyBkZXZpY2VzIGZvciB1c2VyIG1vZGUK
bGludXggYW5kIGl0IGNvbW11bmljYXRlZCB3aXRoICJob3N0IiBzaWRlLiBNeSBkcml2ZXIgZG9l
c24ndCBkZXBlbmRzCm9uIGFueSBIT1NUL1ZNTSBzaWRlIHN0dWZmLiBCYXNpY2FsbHkgd2UgY2Fu
IHVzZSBpdCB0byBjcmVhdGUgdmlydGlvCmRldmljZSBmcm9tIGd1ZXN0IGl0c2VsZi4gT3IgZXZl
biBjcmVhdGUgdmlydGlvIGRldmljZSBvbiBiYXJlIG1ldGFsLgo+IDIpIFBhdGNoIDEgc2FpZCBp
dCdzIHVzZXJzcGFjZSB2aXJ0aW8gZHJpdmVyLCB3aGljaCBJIHRoaW5rIGl0IGlzCj4gYWN0dWFs
bHkgInVzZXJzcGFjZSB2aXJ0aW8gZGV2aWNlIgpVcGRhdGVkIGluIHZlcnNpb24gMiBvZiB0aGlz
IHBhdGNoLgo+IDMpIE5lZWQgdG8gYmUgdmVyYm9zZSBvbiBob3cgdGhlIHZyaW5nIHByb2Nlc3Np
bmcgd29yayBpbiB0aGUgY29tbWl0IGxvZwo+IG9mIHBhdGNoIDEKVXBkYXRlZC4KPiA0KSBJJ20g
Y3VyaW91cyB3aGljaCB0ZXN0aW5nIHlvdSB3YW50IHRvIGFjY29tcGxpc2ggdGhyb3VnaCB0aGlz
IG5ldwo+IHRyYW5zcG9ydCwgSSBndWVzcyB5b3Ugd2FudCB0byB0ZXN0IGEgc3BlY2lmaWMgdmly
dGlvIGRyaXZlcj8KSGVyZSBpcyB0aGUgd2hvbGUgc3Rvcnk6IHdlIHdhbnQgdG8gdGVzdCBvdXIg
Y3VzdG9tIGxpbnV4IGltYWdlLiBJbgp0aGUgcGFzdCwgd2UganVzdCB0ZXN0IG91ciBjdXN0b20g
bGludXggaW1hZ2Ugd2l0aCBxZW11IChhbmQgdmlydGlvCnZnYSksIGFuZCBydW4gcWVtdSBzZXNz
aW9uIG9uIEdvb2dsZSBDbG91ZC4gQXMgeW91IGNhbiBzZWUsIHRoaXMgaXMKbmVzdGVkIHZpcnR1
YWxpemF0aW9uIGFuZCBwZXJmb3JtYW5jZSBodXJ0cy4gQW5kIG1vcmUsIHdlIGhhdmUgYW5vdGhl
cgp2bSBpbnNpZGUgb3VyIGN1c3RvbSBsaW51eCBpbWFnZS4gU28gd2Ugd2FudCB0byByZW1vdmUg
dGhlIHFlbXUgbGF5ZXIsCmp1c3QgcnVuIG91ciBjdXN0b20gbGludXggaW1hZ2Ugb24gR29vZ2xl
IENsb3VkIGRpcmVjdGx5LiBUaGVuIHdlIG5lZWQKc29tZSBraW5kIG9mIFZHQS4gIFNvIGEgImR1
bW15IiB2aXJ0aW8gdmdhIGxvb2tzIGEgZ29vZCBmaXQuCj4gNSkgWW91IG1lbnRpb25lZCB0aGF0
IHlvdSBtYXkgd2FudCB0byBkZXZlbG9wIGNvbW11bmljYXRpb24gYmV0d2Vlbgo+IGtlcm5lbCBh
bmQgdXNlcnNwYWNlLCBhbnkgbW9yZSBkZXRhaWxzIG9uIHRoYXQ/CkN1cnJlbnRseSwgd2UgZG9u
J3QgaGF2ZSBzdWNoIHVzZSBjYXNlLiBCdXQgbWF5YmUgb3RoZXJzIGNhbgpmdXJ0aGVybW9yZSB0
byBleHRlbmQgdXZpcnRpbyBmb3IgdGhpcy4gRm9yIGV4YW1wbGUsIHVzZXIgc3BhY2UgY2FuCnVz
ZSByZWFkL3dyaXRlIHRvIGFjdHVhbGx5IGV4Y2hhbmdlIGRhdGEgd2l0aCBrZXJuZWwuIFRoZW4g
dGhhdCBjb3VsZApiZSB1c2VkIGZvciBzaW11bGF0ZSBtb3JlIGNvbXBsZXggdXNlIGNhc2UuCj4K
PiBUaGFua3MKPgo+Cj4gPgo+ID4gTGVwdG9uIFd1ICgxKToKPiA+ICAgIHZpcnRpbzogQWRkIHV2
aXJ0aW8gZHJpdmVyCj4gPgo+ID4gICBkcml2ZXJzL3ZpcnRpby9LY29uZmlnICAgICAgICB8ICAg
OCArCj4gPiAgIGRyaXZlcnMvdmlydGlvL01ha2VmaWxlICAgICAgIHwgICAxICsKPiA+ICAgZHJp
dmVycy92aXJ0aW8vdXZpcnRpby5jICAgICAgfCA0MDUgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ID4gICBpbmNsdWRlL2xpbnV4L3V2aXJ0aW8uaCAgICAgICB8ICAgOCArCj4g
PiAgIGluY2x1ZGUvdWFwaS9saW51eC91dmlydGlvLmggIHwgIDY5ICsrKysrKwo+ID4gICBzYW1w
bGVzL3V2aXJ0aW8vTWFrZWZpbGUgICAgICB8ICAgOSArCj4gPiAgIHNhbXBsZXMvdXZpcnRpby91
dmlydGlvLXZnYS5jIHwgIDYzICsrKysrKwo+ID4gICA3IGZpbGVzIGNoYW5nZWQsIDU2MyBpbnNl
cnRpb25zKCspCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpcnRpby91dmlydGlv
LmMKPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvdXZpcnRpby5oCj4gPiAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3VhcGkvbGludXgvdXZpcnRpby5oCj4gPiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBzYW1wbGVzL3V2aXJ0aW8vTWFrZWZpbGUKPiA+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHNhbXBsZXMvdXZpcnRpby91dmlydGlvLXZnYS5jCj4gPgo+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
