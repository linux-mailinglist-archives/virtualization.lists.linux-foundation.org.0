Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EE12B5ADC
	for <lists.virtualization@lfdr.de>; Tue, 17 Nov 2020 09:19:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8DA7B84C36;
	Tue, 17 Nov 2020 08:19:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oRNZwUJClS4P; Tue, 17 Nov 2020 08:19:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 174B784AAB;
	Tue, 17 Nov 2020 08:19:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E44BCC07FF;
	Tue, 17 Nov 2020 08:19:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34095C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 08:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2258E84BC9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 08:19:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kOk7BeVHhSG5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 08:19:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4026B84AAB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 08:19:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1605601159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jBSwZgAuEvWHMjM4d4hzcqClmDivjG0qI8H2PdJ0jpE=;
 b=aBvtB6OW+wniVNWwSdyEAPT9jdP+RRtrWwmViYqKzHPhVgQvkYOF9uj+DJrD4A1SyHY+8P
 Vc0r0YVu/Uii3y/e7zY3IEi1dJMNKmtDwBgHe8wwNl23FuvkJG3OwPa1bZzU9LIJOLrqzy
 I6WE9Bcz+Z1k2p8rTPSkfIRoOb8/smc=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0DC8AB3D;
 Tue, 17 Nov 2020 08:19:18 +0000 (UTC)
To: Andy Lutomirski <luto@kernel.org>
References: <20201116152301.24558-1-jgross@suse.com>
 <20201116152301.24558-5-jgross@suse.com>
 <CALCETrW_UO9sksa1agOfs5E7yV+RqOyugEEOBjZY8Z47R-04Pg@mail.gmail.com>
Subject: Re: [PATCH 4/4] x86/xen: drop USERGS_SYSRET64 paravirt call
Message-ID: <194ffa2c-cfc6-29b2-5ee4-3d02581b8e28@suse.com>
Date: Tue, 17 Nov 2020 09:19:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CALCETrW_UO9sksa1agOfs5E7yV+RqOyugEEOBjZY8Z47R-04Pg@mail.gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
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
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Content-Type: multipart/mixed; boundary="===============6683534017688879807=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6683534017688879807==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TZeSXnOA78aXm6rOFpyaEcYCc2ZyiwE9B"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TZeSXnOA78aXm6rOFpyaEcYCc2ZyiwE9B
Content-Type: multipart/mixed; boundary="x8PsBNwBukhgo2A84pdicBLVDWhNt46lb";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andy Lutomirski <luto@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Deep Shah <sdeep@vmware.com>, "VMware, Inc." <pv-drivers@vmware.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <194ffa2c-cfc6-29b2-5ee4-3d02581b8e28@suse.com>
Subject: Re: [PATCH 4/4] x86/xen: drop USERGS_SYSRET64 paravirt call
References: <20201116152301.24558-1-jgross@suse.com>
 <20201116152301.24558-5-jgross@suse.com>
 <CALCETrW_UO9sksa1agOfs5E7yV+RqOyugEEOBjZY8Z47R-04Pg@mail.gmail.com>
In-Reply-To: <CALCETrW_UO9sksa1agOfs5E7yV+RqOyugEEOBjZY8Z47R-04Pg@mail.gmail.com>

--x8PsBNwBukhgo2A84pdicBLVDWhNt46lb
Content-Type: multipart/mixed;
 boundary="------------9EE45120FE990CE4FF143A7A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9EE45120FE990CE4FF143A7A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 16.11.20 17:28, Andy Lutomirski wrote:
> On Mon, Nov 16, 2020 at 7:23 AM Juergen Gross <jgross@suse.com> wrote:
>>
>> USERGS_SYSRET64 is used to return from a syscall via sysret, but
>> a Xen PV guest will nevertheless use the iret hypercall, as there
>> is no sysret PV hypercall defined.
>>
>> So instead of testing all the prerequisites for doing a sysret and
>> then mangling the stack for Xen PV again for doing an iret just use
>> the iret exit from the beginning.
>>
>> This can easily be done via an ALTERNATIVE like it is done for the
>> sysenter compat case already.
>>
>> While at it remove to stale sysret32 remnants.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> Acked-by: Andy Lutomirski <luto@kernel.org>
>=20
> FWIW, you've lost the VGCF_in_syscall optimization.  Let me see if I
> can give it back to you better.

Ah, right.

Nevertheless a simple kernel build is about 0.5% faster with this
patch.


Juergen

--------------9EE45120FE990CE4FF143A7A
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------9EE45120FE990CE4FF143A7A--

--x8PsBNwBukhgo2A84pdicBLVDWhNt46lb--

--TZeSXnOA78aXm6rOFpyaEcYCc2ZyiwE9B
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+zh4UFAwAAAAAACgkQsN6d1ii/Ey9U
fQf7BHJ5Bw5iPQtVJ/DpCX/TPqNeQ3JbRh2IfYAve06UfVeTmwGYkv8kMpPcyvdbh87G1IyYJai6
XwGksJU2kH+Lzj+jt1ISI+/TYIzmgATD1RCs5iyHAkV8Eh6oYvWpCpQaoUGhRSzZ5XfwjyAWtT0m
V8ZY1BH9SOvyL/XvxaEIHOnFsYTcnhno3fhJwZW5jCc148Y2E1Tby91TG1XE2YFfbbgAWc8963Kk
5v4mmQZuPi8MKDTB5tytwc2g8y47YBAtyBKqPO5BuBZoJpNqAgOXgswKmWV4jyB6Ppter0tgZmYL
gQTEpG3aja8xEHLKFPZpZBYBWPRNGubSu7+QTZM6Hg==
=7+u4
-----END PGP SIGNATURE-----

--TZeSXnOA78aXm6rOFpyaEcYCc2ZyiwE9B--

--===============6683534017688879807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============6683534017688879807==--
