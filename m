Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 455C4132C90
	for <lists.virtualization@lfdr.de>; Tue,  7 Jan 2020 18:08:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DED2A20408;
	Tue,  7 Jan 2020 17:08:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pGMeCywAdWN4; Tue,  7 Jan 2020 17:08:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BD8472040D;
	Tue,  7 Jan 2020 17:08:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A24E3C1D89;
	Tue,  7 Jan 2020 17:08:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9064C0881
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 17:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 965B786030
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 17:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zJ4kWzD1A3Yd
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 17:08:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 93C70848F5
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 17:08:39 +0000 (UTC)
Received: from mail-qt1-f173.google.com ([209.85.160.173]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MadGG-1jQfwF10Is-00c7Ij for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Jan 2020 18:08:37 +0100
Received: by mail-qt1-f173.google.com with SMTP id l12so320707qtq.12
 for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Jan 2020 09:08:36 -0800 (PST)
X-Gm-Message-State: APjAAAU9kQrKgRk1aJKhemyAG69R/+1LX5V1EtdVbE5vtY5qIuUAi0m4
 ktO94hBZtRw1ScyRjzk7FZPsajEwP42+29ej3r8=
X-Google-Smtp-Source: APXvYqzRk52Ew2lmsQMfvghk3ylFHcEIR88yL70qbdC0HVK9etbYRWgu7fgyXH4+189J3IyWZY+dkJGnvq1XjVlLM+A=
X-Received: by 2002:a05:620a:a5b:: with SMTP id
 j27mr335658qka.286.1578416914895; 
 Tue, 07 Jan 2020 09:08:34 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <1578415992-24054-6-git-send-email-krzk@kernel.org>
In-Reply-To: <1578415992-24054-6-git-send-email-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Jan 2020 18:08:18 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2eMB34Qd=U_9vGBCN3m5Zh4qDhyEpGH6M=M4e22aPQLQ@mail.gmail.com>
Message-ID: <CAK8P3a2eMB34Qd=U_9vGBCN3m5Zh4qDhyEpGH6M=M4e22aPQLQ@mail.gmail.com>
Subject: Re: [RFT 03/13] sh: Constify ioreadX() iomem argument (as in generic
 implementation)
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:Vagc/0AdGXtVENTMAzQuKQ3TrvHTNR5rKJ9nB+KvnYrZqmGTns4
 da+UoQNylhNICcglLNI0Sb7zB92y43HBQnt7BczacP/AzJI1Ase99gu3MBUhzTeV/BDrwpv
 +xSW5oNl0yMIjKBOM4X9lGuiCihslXHL4qNYPwCI9kzf/h7df4jrvNrn3rXcysnlvw6b80G
 hgW/fpBk9LwV4qdnOrZjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hdLGzu+I+SY=:/dBGG/v0l0OUUpfoiNs01w
 0lFVuKlaKeZnWW7Ln6k+JMrox3pXa8WtyumK3NNRLiBc/6wjw58oRA7ovO6aXjjbVGexw5AIO
 KRjDCcJgUQyMXhz+5SiTQpM6Nss1dsZrQulhwDQKYOEvD09eFptnC9W4I6faoK9tBmOWy+CFx
 vW9Js9IbTBXAiCEEQVG15+Muq5yzE7gKWfOSempKhsB7mtzJIloNDzxe6eNxunblFZtXcpMEc
 GsnkNn+AdErSQCt26tfveUeMikBnZBzgWnlUwqIJ9Znx89BzPL1tXdRX9l9qhl/24+4nRYIW+
 PPkBV+dlKmlRbEKlBBXnsyppdHpSgQlu3wCHGfw64WfR2DtlMfXCXdgJZs0uEL0NRAHJinLda
 ruZZuLpJkseb08oodqYQMI3hV0hkUtSZ8dNazZ7MZL2isvwfiYTyIVllYsAcadxbDuShco7jQ
 qoGz8EXcP96ZSg1lvqR+PyKBf5kS06eVlE+myktj6ndB8JkQQvfS/0kOsCTcTzpYraWUCyalX
 I+mVrlTveGZhTGWDarHJ32YUlT0I9c3vjYMtNVpJDF+GwnwgJ5tl8P1nIyW1tMzmCHJzlI7RG
 FPowHO1+Wgdy7hjDqffXiDjiGkD0TldALOrFHNXm5gavVJRyK7wxNtE7XO/Ow6m+q75/ArIdB
 RuShI9jnVDwMYuvT3UkioAjPuIV5FjiHXCojOpZ2xJsleajaOhH27jjdBdZwmwrKPv14BIQAV
 eOLiiYRc9aUuAt8DN06nrs+3U5q6K5LPPl+N9whkGt/eqg9VOzME1r5qzLNmD3n/5aTwewfs5
 1VIaBU0DASieIrqXKUwY6jUf0SAmnUDcbjFEmrGp5momszQvWJslVzTq/csr/q4IcrGCC4pdY
 k2lBJXvRF3RJBrvklgTA==
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Networking <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Jan 7, 2020 at 5:54 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The ioreadX() helpers have inconsistent interface.  On some architectures
> void *__iomem address argument is a pointer to const, on some not.
>
> Implementations of ioreadX() do not modify the memory under the address
> so they can be converted to a "const" version for const-safety and
> consistency among architectures.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

The patch looks good, but I think this has to be done together with the powerpc
version and the header that declares the function, for bisectibility.

       Arnd
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
