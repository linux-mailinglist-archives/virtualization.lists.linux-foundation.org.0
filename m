Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B6115C35D
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 16:44:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 468B28610F;
	Thu, 13 Feb 2020 15:44:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mwSIo28jnu-u; Thu, 13 Feb 2020 15:44:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A96A4860FD;
	Thu, 13 Feb 2020 15:44:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89A42C0177;
	Thu, 13 Feb 2020 15:44:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A13E5C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8F8682001C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:44:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RqVc8WajJtOW
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:44:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 6E7EF20005
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:44:11 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 70so3293886pgf.8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 07:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PtnJAjzh7uqew0zNNLE9zyJ6OhNOss0AZTQl+TfTd/Y=;
 b=BC9xuuXPOg+0HI+XQUJ1gesfGIHzwpFCiwG4bPl5frKuc9SKlWPqy+1QBSJqvuyfKo
 zAc9puAbANuhaLhdzS6DZHr7uDiMgvTtfvjJ3H/b6czwTvKdWGBRafMN+xrsaehRQw5E
 YE743nJ9vwnqOsReRGhIqJy6Vnx13SXUAyh3PmrGx+LSWhXL9qi+AVB5TqDLGQeJPZwV
 YrIbhN7abwCw9N9QatTQm3fVmFTOuC5SSo/cWdCenCI1PyMV3pBUQK24apcjU24qWm4P
 b0yKNw+ibivfcqNv6W+UvY4YDJQAohzKXdLv7jtveCIK5C9wc9s5lrKvVyoiwf7EXNkF
 dsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PtnJAjzh7uqew0zNNLE9zyJ6OhNOss0AZTQl+TfTd/Y=;
 b=Tiet0BB5cMbLawB7oEjet90GGTCnbiLnc+OhApYZnsl80geHEAXXtrX7iLF21qYd5E
 ir4ZO5YIz+c0ti9OjTUzKj9BCWl0d4nUvkFbXkdApFTufoKokoWgylRCIn6DE9SXjLky
 iTu1kMtbqMkYT2hMfa4MSe0IYf8BN0KAzxoRb6M/rf+Q0XMauMisxUnodrr3subBZRZE
 OrR+TAh3yKuaCml9oKj2yvbxpEtRmoKC7j28g24lZGng1U5awzHtko62xPEDCPOcF5xn
 31sZVv6p5Yd1w/vAtl8MfMC93yd9VOc9WeCEn/IutdscL83nioDAe0drUercTzVI4LXq
 DejA==
X-Gm-Message-State: APjAAAXy+OI4LAUEsLfOyrc7jdgYqEBxIdIUt+kv0qsU8jeQ9h1BlM4x
 EJC7mgZpfrlysvgkI3oKfEEZ9FLy
X-Google-Smtp-Source: APXvYqx9/s0ULmzrD5iCc+gB2s+WOp89Vh5k0Y41cUHGk5Ox3G0Q4jhV5kQoSEmErcYJ2dVuJnSXxQ==
X-Received: by 2002:a63:ca04:: with SMTP id n4mr14990408pgi.110.1581608650773; 
 Thu, 13 Feb 2020 07:44:10 -0800 (PST)
Received: from [192.168.84.170] (8.100.247.35.bc.googleusercontent.com.
 [35.247.100.8])
 by smtp.gmail.com with ESMTPSA id b25sm3552541pfo.38.2020.02.13.07.44.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2020 07:44:10 -0800 (PST)
Subject: Re: [PATCH] virtio: Work around frames incorrectly marked as gso
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
References: <20191209104824.17059-1-anton.ivanov@cambridgegreys.com>
 <57230228-7030-c65f-a24f-910ca52bbe9e@cambridgegreys.com>
 <f78bfe6e-2ffc-3734-9618-470f1afea0c6@redhat.com>
 <918222d9-816a-be70-f8af-b8dfcb586240@cambridgegreys.com>
 <20200211053502-mutt-send-email-mst@kernel.org>
 <9547228b-aa93-f2b6-6fdc-8d33cde3716a@cambridgegreys.com>
 <20200213045937-mutt-send-email-mst@kernel.org>
From: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <94fb9656-99ee-a001-e428-9d76c3620e61@gmail.com>
Date: Thu, 13 Feb 2020 07:44:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200213045937-mutt-send-email-mst@kernel.org>
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-um@lists.infradead.org,
 virtualization@lists.linux-foundation.org
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

CgpPbiAyLzEzLzIwIDI6MDAgQU0sIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBXZWQs
IEZlYiAxMiwgMjAyMCBhdCAwNTozODowOVBNICswMDAwLCBBbnRvbiBJdmFub3Ygd3JvdGU6Cj4+
Cj4+Cj4+IE9uIDExLzAyLzIwMjAgMTA6MzcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IE9uIFR1ZSwgRmViIDExLCAyMDIwIGF0IDA3OjQyOjM3QU0gKzAwMDAsIEFudG9uIEl2YW5vdiB3
cm90ZToKPj4+PiBPbiAxMS8wMi8yMDIwIDAyOjUxLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+Pgo+
Pj4+PiBPbiAyMDIwLzIvMTEg5LiK5Y2IMTI6NTUsIEFudG9uIEl2YW5vdiB3cm90ZToKPj4+Pj4+
Cj4+Pj4+Pgo+Pj4+Pj4gT24gMDkvMTIvMjAxOSAxMDo0OCwgYW50b24uaXZhbm92QGNhbWJyaWRn
ZWdyZXlzLmNvbSB3cm90ZToKPj4+Pj4+PiBGcm9tOiBBbnRvbiBJdmFub3YgPGFudG9uLml2YW5v
dkBjYW1icmlkZ2VncmV5cy5jb20+Cj4+Pj4+Pj4KPj4+Pj4+PiBTb21lIG9mIHRoZSBmcmFtZXMg
bWFya2VkIGFzIEdTTyB3aGljaCBhcnJpdmUgYXQKPj4+Pj4+PiB2aXJ0aW9fbmV0X2hkcl9mcm9t
X3NrYigpIGhhdmUgbm8gR1NPX1RZUEUsIG5vCj4+Pj4+Pj4gZnJhZ21lbnRzIChkYXRhX2xlbiA9
IDApIGFuZCBsZW5ndGggc2lnbmlmaWNhbnRseSBzaG9ydGVyCj4+Pj4+Pj4gdGhhbiB0aGUgTVRV
ICg3NTIgaW4gbXkgZXhwZXJpbWVudHMpLgo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhpcyBpcyBvYnNlcnZl
ZCBvbiByYXcgc29ja2V0cyByZWFkaW5nIG9mZiB2RXRoIGludGVyZmFjZXMKPj4+Pj4+PiBpbiBh
bGwgNC54IGFuZCA1Lngga2VybmVscyBJIHRlc3RlZC4KPj4+Pj4+Pgo+Pj4+Pj4+IFRoZXNlIGZy
YW1lcyBhcmUgcmVwb3J0ZWQgYXMgaW52YWxpZCB3aGlsZSB0aGV5IGFyZSBpbiBmYWN0Cj4+Pj4+
Pj4gZ3NvLWxlc3MgZnJhbWVzLgo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhpcyBwYXRjaCBtYXJrcyB0aGUg
dm5ldCBoZWFkZXIgYXMgbm8tR1NPIGZvciB0aGVtIGluc3RlYWQKPj4+Pj4+PiBvZiByZXBvcnRp
bmcgaXQgYXMgaW52YWxpZC4KPj4+Pj4+Pgo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFudG9uIEl2
YW5vdiA8YW50b24uaXZhbm92QGNhbWJyaWRnZWdyZXlzLmNvbT4KPj4+Pj4+PiAtLS0KPj4+Pj4+
PiAgwqAgaW5jbHVkZS9saW51eC92aXJ0aW9fbmV0LmggfCA4ICsrKysrKy0tCj4+Pj4+Pj4gIMKg
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4+Pj4K
Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC92aXJ0aW9fbmV0LmggYi9pbmNsdWRl
L2xpbnV4L3ZpcnRpb19uZXQuaAo+Pj4+Pj4+IGluZGV4IDBkMWZlOTI5N2FjNi4uZDkwZDVjZmYx
YjlhIDEwMDY0NAo+Pj4+Pj4+IC0tLSBhL2luY2x1ZGUvbGludXgvdmlydGlvX25ldC5oCj4+Pj4+
Pj4gKysrIGIvaW5jbHVkZS9saW51eC92aXJ0aW9fbmV0LmgKPj4+Pj4+PiBAQCAtMTEyLDggKzEx
MiwxMiBAQCBzdGF0aWMgaW5saW5lIGludAo+Pj4+Pj4+IHZpcnRpb19uZXRfaGRyX2Zyb21fc2ti
KGNvbnN0IHN0cnVjdCBza19idWZmICpza2IsCj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGhkci0+Z3NvX3R5cGUgPSBWSVJUSU9fTkVUX0hEUl9HU09fVENQVjQ7Cj4+Pj4+Pj4g
IMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlIGlmIChzaW5mby0+Z3NvX3R5cGUgJiBTS0JfR1NPX1RD
UFY2KQo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoZHItPmdzb190eXBlID0g
VklSVElPX05FVF9IRFJfR1NPX1RDUFY2Owo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBlbHNlCj4+
Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGVsc2Ugewo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChz
a2ItPmRhdGFfbGVuID09IDApCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBoZHItPmdzb190eXBlID0gVklSVElPX05FVF9IRFJfR1NPX05PTkU7Cj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZWxzZQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+Pj4+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmIChzaW5mby0+Z3NvX3R5cGUgJiBTS0JfR1NPX1RDUF9FQ04p
Cj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhkci0+Z3NvX3R5cGUgfD0gVklS
VElPX05FVF9IRFJfR1NPX0VDTjsKPj4+Pj4+PiAgwqDCoMKgwqDCoCB9IGVsc2UKPj4+Pj4+Pgo+
Pj4+Pj4KPj4+Pj4+IHBpbmcuCj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBEbyB5b3UgbWVhbiBnc29fc2l6
ZSBpcyBzZXQgYnV0IGdzb190eXBlIGlzIG5vdD8gTG9va3MgbGlrZSBhIGJ1Zwo+Pj4+PiBlbHNl
d2hlcmUuCj4+Pj4+Cj4+Pj4+IFRoYW5rcwo+Pj4+Pgo+Pj4+Pgo+Pj4+IFllcy4KPj4+Pgo+Pj4+
IEkgY291bGQgbm90IHRyYWNlIGl0IHdoZXJlIGl0IGlzIGNvbWluZyBmcm9tLgo+Pj4+Cj4+Pj4g
SSBzZWUgaXQgd2hlbiBkb2luZyByZWN2bW1zZyBvbiByYXcgc29ja2V0cyBpbiB0aGUgVU1MIHZl
Y3RvciBuZXR3b3JrCj4+Pj4gZHJpdmVycy4KPj4+Pgo+Pj4KPj4+IEkgdGhpbmsgd2UgbmVlZCB0
byBmaW5kIHRoZSBjdWxwcml0IGFuZCBmaXggaXQgdGhlcmUsIGxvdHMgb2Ygb3RoZXIgdGhpbmdz
Cj4+PiBjYW4gYnJlYWsgb3RoZXJ3aXNlLgo+Pj4gSnVzdCBwcmludGluZyBvdXQgc2tiLT5kZXYt
Pm5hbWUgc2hvdWxkIGRvIHRoZSB0cmljaywgbm8/Cj4+Cj4+IFRoZSBwcmludGsgaW4gdmlydGlv
X25ldF9oZHJfZnJvbV9za2Igc2F5cyBOVUxMLgo+Pgo+PiBUaGF0IGlzIHByb2JhYmx5IG5vcm1h
bCBmb3IgYSBsb2NhbGx5IG9yaWdpbmF0ZWQgZnJhbWUuCj4+Cj4+IEkgY2Fubm90IHJlcHJvZHVj
ZSB0aGlzIHdpdGggbmV0d29yayB0cmFmZmljIGJ5IHRoZSB3YXkgLSBpdCBoYXBwZW5zIG9ubHkg
aWYgdGhlIHRyYWZmaWMgaXMgbG9jYWxseSBvcmlnaW5hdGVkIG9uIHRoZSBob3N0Lgo+Pgo+PiBB
LAo+IAo+IE9LIHNvIGlzIGl0IGNvZGUgaW4gX190Y3BfdHJhbnNtaXRfc2tiIHRoYXQgc2V0cyBn
c29fc2l6ZSB0byBub24tbnVsbAo+IHdoZW4gZ3NvX3R5cGUgaXMgMD8KPgoKQ29ycmVjdCB3YXkg
dG8gZGV0ZXJtaW5lIGlmIGEgcGFja2V0IGlzIGEgZ3NvIG9uZSBpcyBieSBsb29raW5nIGF0IGdz
b19zaXplLgpUaGVuIG9ubHkgaXQgaXMgbGVnYWwgbG9va2luZyBhdCBnc29fdHlwZQoKCnN0YXRp
YyBpbmxpbmUgYm9vbCBza2JfaXNfZ3NvKGNvbnN0IHN0cnVjdCBza19idWZmICpza2IpCnsKICAg
IHJldHVybiBza2Jfc2hpbmZvKHNrYiktPmdzb19zaXplOwp9CgovKiBOb3RlOiBTaG91bGQgYmUg
Y2FsbGVkIG9ubHkgaWYgc2tiX2lzX2dzbyhza2IpIGlzIHRydWUgKi8Kc3RhdGljIGlubGluZSBi
b29sIHNrYl9pc19nc29fdjYoY29uc3Qgc3RydWN0IHNrX2J1ZmYgKnNrYikKLi4uCgoKVGhlcmUg
aXMgYWJzb2x1dGVseSBubyByZWxhdGlvbiBiZXR3ZWVuIEdTTyBhbmQgc2tiLT5kYXRhX2xlbiwg
c2tiIGNhbiBiZSBsaW5lYXJpemVkCmZvciB2YXJpb3VzIG9ydGhvZ29uYWwgcmVhc29ucy4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
